class ApiConfig {
  static const String baseUrl = 'https://7ee82e189612.ngrok-free.app/api/v1';

  // Auth Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';

  // User Endpoints
  static const String forgetpassword = '/auth/forgot_password';
  static const String otpendpoint = '/auth/verify_otp';
  static const String restpasswordendpoint='/auth/reset_password';
  static const String changepasswordendpoint='/auth/update_password';
  static const String psotappointment='/Appointment';
  static const String getAppointmentEndpoint='/Appointment';
  static const String track='/track';
  static const String trackhistory='/track?trackType=';

  // Other modules...
}