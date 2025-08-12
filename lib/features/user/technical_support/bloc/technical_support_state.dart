part of 'technical_support_cubit.dart';

@immutable
sealed class TechnicalSupportState {}

final class TechnicalSupportInitial extends TechnicalSupportState {}

/// Make Ticket
final class MakeTicketLoadingState extends TechnicalSupportState {}

final class MakeTicketSuccessState extends TechnicalSupportState {}

final class MakeTicketErrorState extends TechnicalSupportState {}

/// Send Message
final class SendMessageLoadingState extends TechnicalSupportState {}

final class SendMessageSuccessState extends TechnicalSupportState {}

final class SendMessageErrorState extends TechnicalSupportState {}

/// Get All Tickets
final class GetAllTicketsLoadingState extends TechnicalSupportState {}

final class GetAllTicketsSuccessState extends TechnicalSupportState {}

final class GetAllTicketsErrorState extends TechnicalSupportState {}

/// Get Ticket Details
final class GetTicketDetailsLoadingState extends TechnicalSupportState {}

final class GetTicketDetailsSuccessState extends TechnicalSupportState {}

final class GetTicketDetailsErrorState extends TechnicalSupportState {}

/// Priority
final class PrioritySelectedState extends TechnicalSupportState {}