class EndPoints {
  /// BaseUrl
  static const String baseUrl = 'https://backend.truebalance.com.sa/';

  /// Auth
  static const String login = 'api/user/auth/login';
  static const String register = 'api/user/auth/register';
  static const String logout = 'api/user/auth/logout';
  static const String forgetPassword = 'api/user/auth/forget-password';
  static const String verfiyCode = 'api/user/auth/verify-code';
  static const String verifyOTP = 'api/user/auth/verify-code';
  static const String createNewPassword = 'api/user/auth/update-password';
  static const String getSliders = 'api/frontend/sliders';
  static const String getServies = '/api/frontend/services';

  static const String getDoctors = 'api/frontend/doctors';
  static const String getSlots = 'api/frontend/user/doctors/getSlots';

  static const String bookSession = 'api/frontend/user/consultations/book';
  static const String getTherapist = 'api/frontend/therapists';
  static const String getProfileData = 'api/user/profile/details';
  static const String updateProfileData = 'api/user/profile/updateData';
  static const String makeTicket = 'api/frontend/clientTicket/create';
  static const String sendMessage = 'api/frontend/clientTicket/createMessage';
  static const String getTickets = 'api/frontend/clientTicket/list';
  static const String ticketDetails = 'api/frontend/clientTicket/show';

  static const String getconsultations = 'api/frontend/user/consultations';
  static const String deleteConsultation =
      'api/frontend/user/consultations/cancel';

  static const String getReports =
      'api/frontend/treatment-plans/medical-reports/all';

  static const String getOrDeleteNotifications = "api/frontend/notifications";
  static const String makeAsRead =
      "api/frontend/notifications/mark-all-as-read";

  /// Treatment Plans for Therapist
  static String treatmentPlans(int therapistId) =>
      'api/frontend/therapists/$therapistId/treatment-plans';

  /// get user treatment plans

  static String getShowServices(int serviceId) =>
      'api/frontend/services/$serviceId';
  static String treatmentPlansdetails(int therapistId) =>
      "api/frontend/treatment-plans/$therapistId";

  static String addSession(int therapistId) =>
      "api/frontend/treatment-plans/$therapistId/sessions";
  static String rateSession(int therapistId) =>
      "api/frontend/treatment-plans/sessions/$therapistId/rate";

  /// get about us

  /// get privacy
  static String getstaticPages = 'api/frontend/staticPages';
  static String getAllDoctorsConsultations =
      'api/frontend/doctor/consultations/users';

  static String getAllConsultation(bool isPending, int id) =>
      'api/frontend/doctor/consultations/user/get-all-consultations/$id?status=${isPending ? 'pending' : 'completed'}';

  /// get sessions of treatment plans for therapist
  static String getSessionsOfTreatmentPlans(bool isPending, int id) =>
      'api/frontend/therapist/treatment-plans/sessions/$id?status=${isPending ? 'pending' : 'completed'}';

  static String getusertreatmentPlansfortherapist(
    int usertId,
    bool isPending,
  ) =>
      'api/frontend/therapist/treatment-plans/users/$usertId?status=${isPending ? 'pending' : 'completed'}';
  static String consultationAccess = 'api/frontend/doctor/consultations/assess';

  static String rateSessionTherapist(int therapistId) =>
      "api/frontend/therapist/treatment-plans/sessions/complete/$therapistId";
  static String getReviews(int therapistId) =>
      "api/frontend/doctors/reviews/$therapistId";

  static String addRateCosultation = 'api/frontend/user/consultations/rate';
  static String getDoctorCalender =
      'api/frontend/doctor/consultations/weekly-consultations';
  static String getTheipstCalender =
      'api/frontend/therapist/treatment-plans/weekly-treatment-plans';
}
