import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/about_us/about_us_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/tickets/all_tickets_data_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/tickets/ticket_details_data_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/repos/repos.dart';

part 'technical_support_state.dart';

class TechnicalSupportCubit extends Cubit<TechnicalSupportState> {
  TechnicalSupportCubit(this.technicalSupportRepo)
      : super(TechnicalSupportInitial());

  final TechnicalSupportRepo technicalSupportRepo;
  AllTicketsDataModel? allTicketsDataModel;
  TicketDetailsDataModel? ticketDetailsDataModel;
  AboutUsModel? aboutUsModel;

  TextEditingController messageController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  String? selectedPriority;

  /// Set selected priority
  void setPriority(String? priority) {
    selectedPriority = priority;
    emit(PrioritySelectedState());
  }

  /// Make Ticket
  Future<void> makeTicket({
    required String priority,
  }) async {
    showLoading();
    emit(MakeTicketLoadingState());
    final result = await technicalSupportRepo.makeTicket(
      title: titleController.text,
      priority: priority,
    );
    result.when(
      success: (data) {
        hideLoading();
        emit(MakeTicketSuccessState());
      },
      failure: (error) {
        hideLoading();
        emit(MakeTicketErrorState());
      },
    );
  }

  /// Send Message
  Future<void> sendMessage({
    required String ticketId,
  }) async {
    showLoading();
    emit(SendMessageLoadingState());
    final result = await technicalSupportRepo.sendMessage(
      ticketId: ticketId,
      message: messageController.text,
    );
    result.when(
      success: (data) {
        hideLoading();
        scrollToBottom();
        emit(SendMessageSuccessState());
      },
      failure: (error) {
        hideLoading();
        emit(SendMessageErrorState());
      },
    );
  }

  final ScrollController allTicketsScrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void setupTicketsScrollController() {
    allTicketsScrollController.addListener(() {
      if (allTicketsScrollController.position.pixels >=
              allTicketsScrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreTickets();
      }
    });
  }

  /// Get All Tickets
  Future<void> getAllTickets() async {
    currentPage = 1;
    emit(GetAllTicketsLoadingState());
    final result = await technicalSupportRepo.getAllTickets(page: currentPage);
    result.when(
      success: (data) {
        allTicketsDataModel = data;
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        lastPage = data.data?.meta?.lastPage ?? lastPage;
        emit(GetAllTicketsSuccessState());
      },
      failure: (error) {
        emit(GetAllTicketsErrorState());
      },
    );
  }

  /// load more tickets
  Future<void> loadMoreTickets() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(TicketsLoadingMore());

    final result =
        await technicalSupportRepo.getAllTickets(page: currentPage + 1);
    result.when(
      success: (data) {
        allTicketsDataModel?.data?.tickets?.addAll(data.data?.tickets ?? []);
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(GetAllTicketsSuccessState());
      },
      failure: (error) {
        emit(GetAllTicketsErrorState());
      },
    );
    isLoadingMore = false;
  }

  /// Get Ticket Details
  Future<void> getTicketDetails({
    required int ticketId,
  }) async {
    emit(GetTicketDetailsLoadingState());
    final result = await technicalSupportRepo.getTicketDetails(
      ticketId: ticketId,
    );
    result.when(
      success: (data) {
        ticketDetailsDataModel = data;
        scrollToBottom();

        emit(GetTicketDetailsSuccessState());
      },
      failure: (error) {
        emit(GetTicketDetailsErrorState());
      },
    );
  }

  /// Get About Us
  Future<void> getstaticPages() async {
    emit(GetAboutUsLoadingState());
    final result = await technicalSupportRepo.getstaticPages();
    result.when(
      success: (data) {
        aboutUsModel = data;
        emit(GetAboutUsSuccessState());
      },
      failure: (error) {
        emit(GetAboutUsErrorState());
      },
    );
  }



  ScrollController scrollController = ScrollController();
 
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 20,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
