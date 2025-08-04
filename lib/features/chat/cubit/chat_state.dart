abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class SendTextState extends ChatState {}

final class IsTypeingState extends ChatState {}

final class ScroolState extends ChatState {}

final class GetSingleChatLoadingState extends ChatState {}

final class GetSingleChatErrorgState extends ChatState {}

final class GetSingleChatSuccessState extends ChatState {}

final class SendMassageLoadingState extends ChatState {}

final class SendMassageErrorgState extends ChatState {}

final class SendMassageSuccessState extends ChatState {}

final class GetSpecificTicketLoading extends ChatState {}

final class GetSpecificTicketSuccess extends ChatState {}

final class GetSpecificTicketError extends ChatState {}
