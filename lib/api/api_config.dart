class ApiConfig {
  static const String baseUrl = 'https://server.momentumactivity.com';

  // Auth Endpoints$
  static const String loginEndpoint = '/api/v1/user/login';
  static const String forgotpasswordendpoint='/api/v1/user/forgot-password';
  static const String verifyOtpendpoint='/api/v1/user/verify-reset-otp';
  static const String updatepassword='/api/v1/user/reset-password';
  static const String updateprofile='/api/v1/user/update-profile';
  static const String eventsEndpoint='/api/v1/event?page=1&limit=10000';
  static const String getmyevents='/api/v1/event/my/events';
  static const String getrecievedRequests='/api/v1/connection/pending-requests';
  static const String acceptConnection='/api/v1/connection/accept/';
  static const String sendconnectionrequest='/api/v1/connection/send';
  static const String getmyconnection='/api/v1/connection/my-connections';
  static const String deleteaccount='/api/v1/admin/users/';

}