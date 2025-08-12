import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class TechnicalSupportApiServices {
  final DioHelper _dioHelper;

  TechnicalSupportApiServices(this._dioHelper);

  /// Make Ticket
  Future<Response?> makeTicket({
    required String title,
    required String priority,
  }) async {
    return _dioHelper.post(
      endPoint: EndPoints.makeTicket,
      data: {
        'title': title,
        'priority': priority,
      },
    );
  }

  /// Send Message
  Future<Response?> sendMessage({
    required String ticketId,
    required String message,
  }) async {
    return _dioHelper.post(
      endPoint: EndPoints.sendMessage,
      data: {
        'ticket_id': ticketId,
        'message': message,
      },
    );
  }

  /// Get All Tickets
  Future<Response?> getAllTickets() async {
    return _dioHelper.get(endPoint: EndPoints.getTickets);
  }

  /// Get Ticket Details
  Future<Response?> getTicketDetails({
    required String ticketId,
  }) async {
    return _dioHelper.get(endPoint: '${EndPoints.ticketDetails}/$ticketId');
  }
}
