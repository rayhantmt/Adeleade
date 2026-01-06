import 'package:flutter/widgets.dart';

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

}