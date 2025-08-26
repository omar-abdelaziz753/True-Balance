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
  static const String makeTicket = 'api/frontend/clientTicket/create';
  static const String sendMessage = 'api/frontend/clientTicket/createMessage';
  static const String getTickets = 'api/frontend/clientTicket/list';
  static const String ticketDetails = 'api/frontend/clientTicket/show';

  static const String getconsultations = 'api/frontend/user/consultations';

  static const String getReports =
      'api/frontend/treatment-plans/medical-reports/all';

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
  static String getAboutUs = 'api/frontend/staticPages/about_us';
  /// get privacy
  static String getPrivacy = 'api/frontend/staticPages/privacy_policy';
  static String getTerms = 'api/frontend/staticPages/terms_and_conditions';
  static String getAllDoctorsConsultations(bool isPending) =>
      'api/frontend/doctor/consultations/users?status=${isPending ? 'pending' : 'completed'}';

  static String getAllConsultation(bool isPending, int id) =>
      'api/frontend/doctor/consultations/user/get-all-consultations/$id?status=${isPending ? 'pending' : 'completed'}';

 /// get sessions of treatment plans for therapist
  static String getSessionsOfTreatmentPlans(bool isPending, int id) =>
      'api/frontend/therapist/treatment-plans/sessions/$id?status=${isPending ? 'pending' : 'completed'}';

 static String getusertreatmentPlansfortherapist(int usertId , bool isPending,) =>
      'api/frontend/therapist/treatment-plans/users/$usertId?status=${isPending ? 'pending' : 'completed'}';
  static String consultationAccess = 'api/frontend/doctor/consultations/assess';
}
