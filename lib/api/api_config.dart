class ApiConfig {
  static const String baseUrl = 'https://server.momentumactivity.com';

  // Auth Endpoints$
  static const String loginEndpoint = '/api/v1/user/login';
  static const String forgotpasswordendpoint='/api/v1/user/forgot-password';
  static const String verifyOtpendpoint='/api/v1/user/verify-reset-otp';
  static const String updatepassword='/api/v1/user/reset-password';
  static const String updateprofile='/api/v1/user/update-profile';

}