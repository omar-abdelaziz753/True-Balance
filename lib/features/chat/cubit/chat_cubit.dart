// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:truee_balance_app/features/chat/cubit/chat_state.dart';

// class ChatCubit extends Cubit<ChatState> {
//   ChatCubit(this.chatRepo) : super(ChatInitial());
//   ScrollController scrollController = ScrollController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TicketDetailsModel? ticketDetailsModel;
//   final ChatRepo chatRepo;

//   void scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (scrollController.hasClients) {
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent + 20,
//           duration: const Duration(milliseconds: 1),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   final TextEditingController masseageController = TextEditingController();

//   bool isTypeing = false;

//   void showSendBUtton({required String letters}) {
//     if (letters.isNotEmpty) {
//       if (letters.length > 1) {
//         return;
//       } else {
//         isTypeing = true;
//         emit(IsTypeingState());
//       }
//     } else {
//       isTypeing = false;
//       emit(IsTypeingState());
//     }
//   }

//   bool isFirstTime = true;

//   Future getSpecificTicket(int ticketId) async {
//     if (isFirstTime) {
//       isFirstTime = false;
//       emit(GetSpecificTicketLoading());
//     }

//     final result = await chatRepo.getSpecificTicket(ticketId);
//     result.when(success: (data) {
//       ticketDetailsModel = data;
//       emit(GetSpecificTicketSuccess());
//     }, failure: (error) {
//       emit(GetSpecificTicketError());
//     });
//   }

//   Future sendMessage({
//     required int ticketId,
//     required String message,
//   }) async {
//     showLoading();
//     emit(SendMassageLoadingState());
//     final result = await chatRepo.sendMessage(ticketId, message);
//     result.when(success: (data) async {
//       hideLoading();
//       masseageController.clear();
//       isTypeing = false;
//       await getSpecificTicket(ticketDetailsModel!.data.id);
//       scrollToBottom();
//       emit(SendMassageSuccessState());
//     }, failure: (error) {
//       hideLoading();
//       emit(SendMassageErrorgState());
//     });
//   }

//   @override
//   Future<void> close() {
//     masseageController.dispose();
//     scrollController.dispose();

//     return super.close();
//   }
// }
