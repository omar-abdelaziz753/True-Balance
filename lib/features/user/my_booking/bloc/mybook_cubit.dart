import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:true_balance_app/core/utils/easy_loading.dart';
import 'package:true_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:true_balance_app/features/user/my_booking/data/repos/repos.dart';

part 'mybook_state.dart';

class MybookCubit extends Cubit<MybookState> {
  MybookCubit(this.myBookingRepos) : super(MybookInitial());

  final MyBookingRepos myBookingRepos;
  bool hasRated = false;

  ConsultationsResponse? consultationsResponse;
  final ScrollController consultationsScrollController = ScrollController();
  bool _consultationsScrollListenerAdded = false;
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  /// Set on load-more failure while the already-loaded list is preserved
  /// (the failure re-emits [ConsultationsSuccess] so the UI keeps its data).
  String? loadMoreErrorMessage;

  void setupConsultationsScrollController() {
    if (_consultationsScrollListenerAdded) return;
    _consultationsScrollListenerAdded = true;
    consultationsScrollController.addListener(_onConsultationsScroll);
  }

  void _onConsultationsScroll() {
    if (consultationsScrollController.position.pixels >=
            consultationsScrollController.position.maxScrollExtent - 100 &&
        !isLoadingMore) {
      loadMoreConsultations();
    }
  }

  @override
  Future<void> close() {
    consultationsScrollController.removeListener(_onConsultationsScroll);
    consultationsScrollController.dispose();
    return super.close();
  }

  bool? isPending;
  String? fromDate;
  String? toDate;
  String? doctorName;
  Future<void> getAllconsultations({required bool isPending}) async {
    currentPage = 1;
    this.isPending = isPending;
    emit(ConsultationsLoading());
    final result = await myBookingRepos.getConsultations(
      page: currentPage,
      isPending: isPending,
      doctorName: doctorName,
      fromDate: fromDate,
      toDate: toDate,
    );

    result.when(
      success: (data) {
        consultationsResponse = data;
        currentPage = data.data.meta.currentPage ?? 1;
        lastPage = data.data.meta.lastPage ?? 1;
        loadMoreErrorMessage = null;
        emit(ConsultationsSuccess());
      },
      failure: (error) {
        emit(ConsultationsError());
      },
    );
  }

  /// load more consultations
  Future<void> loadMoreConsultations() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    loadMoreErrorMessage = null;
    emit(ConsultationsLoadingMore());

    final result = await myBookingRepos.getConsultations(
      page: currentPage + 1,
      isPending: isPending!,
      doctorName: doctorName,
      fromDate: fromDate,
      toDate: toDate,
    );

    result.when(
      success: (data) {
        consultationsResponse?.data.data.addAll(data.data.data);
        currentPage = data.data.meta.currentPage ?? currentPage;
        loadMoreErrorMessage = null;
        emit(ConsultationsSuccess());
      },
      failure: (error) {
        // Preserve the already-loaded list: the UI reads
        // `consultationsResponse`, and re-emitting success keeps the data
        // while dismissing the load-more spinner. The error is carried on
        // `loadMoreErrorMessage` instead of a wiping error state.
        loadMoreErrorMessage = error.toString();
        emit(ConsultationsSuccess());
      },
    );
    isLoadingMore = false;
  }

  /// Delete Consultation
  Future<void> deleteConsultation({required int id}) async {
    emit(DeleteConsultationLoading());
    showLoading();
    final result = await myBookingRepos.deleteConsultation(consultationId: id);
    result.when(
        success: (message) => {
              hideLoading(),
              emit(DeleteConsultationSuccess()),
            },
        failure: (error) => {
              hideLoading(),
              emit(DeleteConsultationFailure()),
            });
  }

  Future<void> addRateConsultation({
    required int consultationId,
    required int userRate,
    required String userMessage,
  }) async {
    emit(AddRateLoading());
    showLoading();
    final result = await myBookingRepos.addRateConsultation(
      consultationId: consultationId,
      userRate: userRate,
      userMessage: userMessage,
    );

    result.when(
        success: (message) => {
              hasRated = true,
              hideLoading(),
              emit(AddRateSuccess()),
            },
        failure: (error) => {
              hideLoading(),
              emit(AddRateFailure()),
            });
  }

  void updateHasRated(bool value) {
    hasRated = value;
    emit(MybookInitial()); // or any state to refresh UI
  }

  /// Initiate Payment for pending consultation
  Future<void> initiatePayment({required int consultationId}) async {
    emit(InitiatePaymentLoading());
    showLoading();
    final result = await myBookingRepos.initiateConsultationPayment(
      consultationId: consultationId,
    );

    result.when(
      success: (data) {
        hideLoading();
        final amountValue = data['amount'];
        double amount;
        if (amountValue is String) {
          amount = double.tryParse(amountValue) ?? 0;
        } else if (amountValue is num) {
          amount = amountValue.toDouble();
        } else {
          amount = 0;
        }

        emit(InitiatePaymentSuccess(
          paymentUrl: data['payment_url'] ?? '',
          transactionId: data['transaction_id'] ?? 0,
          consultationId: data['consultation_id'] ?? consultationId,
          amount: amount,
        ));
      },
      failure: (error) {
        hideLoading();
        emit(InitiatePaymentFailure(error.toString()));
      },
    );
  }
}
