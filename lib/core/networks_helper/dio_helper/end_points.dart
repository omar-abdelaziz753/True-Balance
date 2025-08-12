class EndPoints {
  /// BaseUrl
  static const String baseUrl = 'https://truebalance.backend.tanfeethi.com.sa/';

  /// Auth
  static const String login = 'api/user/auth/login';
  static const String register = 'api/user/auth/register';
  static const String logout = 'api/user/auth/logout';
  static const String forgetPassword = 'api/user/auth/forget-password';
  static const String verfiyCode = 'api/user/auth/verify-code';
  static const String getSliders = 'api/frontend/sliders';
  static const String getServies = '/api/frontend/services';

  static const String getDoctors = 'api/frontend/doctors';
  static const String getSlots = 'api/frontend/user/doctors/getSlots';

  static const String bookSession = 'api/frontend/user/consultations/book';
  static const String getTherapist = 'api/frontend/therapists';
  static const String getProfileData = 'api/user/profile/details';
  static const String updateProfileData = 'api/user/profile/updateData';

  static String treatmentPlans(int therapistId) =>
      'api/frontend/therapists/$therapistId/treatment-plans';

  static String getShowServices(int serviceId) =>
      'api/frontend/services/$serviceId';
  static String treatmentPlansdetails(int therapistId) =>
      "api/frontend/treatment-plans/$therapistId";

  static String addSession(int therapistId) =>
      "api/frontend/treatment-plans/$therapistId/sessions";
  static String rateSession(int therapistId) =>
      "api/frontend/treatment-plans/sessions/$therapistId/rate";
}
