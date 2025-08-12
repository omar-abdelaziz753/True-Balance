import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/user/technical_support/data/api_services/api_services.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/tickets/all_tickets_data_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/tickets/ticket_details_data_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/repos/repos.dart';

part 'technical_support_state.dart';

class TechnicalSupportCubit extends Cubit<TechnicalSupportState> {
  TechnicalSupportCubit(this.technicalSupportRepo)
      : super(TechnicalSupportInitial());

  final TechnicalSupportRepo? technicalSupportRepo;
  AllTicketsDataModel? allTicketsDataModel;
  TicketDetailsDataModel? ticketDetailsDataModel;

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
    final result = await technicalSupportRepo!.makeTicket(
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
    final result = await technicalSupportRepo!.sendMessage(
      ticketId: ticketId,
      message: messageController.text,
    );
    result.when(
      success: (data) {
        hideLoading();
        emit(SendMessageSuccessState());
      },
      failure: (error) {
        hideLoading();
        emit(SendMessageErrorState());
      },
    );
  }

  /// Get All Tickets
  Future<void> getAllTickets() async {
    emit(GetAllTicketsLoadingState());
    final result = await technicalSupportRepo!.getAllTickets();
    result.when(
      success: (data) {
        allTicketsDataModel = data;
        emit(GetAllTicketsSuccessState());
      },
      failure: (error) {
        emit(GetAllTicketsErrorState());
      },
    );
  }

  /// Get Ticket Details
  Future<void> getTicketDetails({
    required String ticketId,
  }) async {
    emit(GetTicketDetailsLoadingState());
    final result = await technicalSupportRepo!.getTicketDetails(
      ticketId: ticketId,
    );
    result.when(
      success: (data) {
        ticketDetailsDataModel = data;
        emit(GetTicketDetailsSuccessState());
      },
      failure: (error) {
        emit(GetTicketDetailsErrorState());
      },
    );
  }
}
