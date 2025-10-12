import 'package:get/get.dart';
import 'package:mementum/modules/forgot_password/forgot_password_view.dart';
import 'package:mementum/modules/log_in/log_in_binding.dart';
import 'package:mementum/modules/log_in/log_in_view.dart';
import 'package:mementum/modules/main_screen/main_screen.dart';
import 'package:mementum/modules/main_screen/main_screen_binding.dart';
import 'package:mementum/modules/otp_page/otp_page_binding.dart';
import 'package:mementum/modules/otp_page/otp_page_view.dart';
import 'package:mementum/modules/request_an_invite/requesst_an_invite_binding.dart';
import 'package:mementum/modules/request_an_invite/request_an_invite_view.dart';
import 'package:mementum/modules/request_an_invite_second/request_an_invite_second.dart';
import 'package:mementum/modules/request_an_invite_second/request_an_invite_second_binding.dart';
import 'package:mementum/modules/unlock_momentum/unlock_momentum_view.dart';
import 'package:mementum/modules/update_password/update_password_binding.dart';
import 'package:mementum/modules/update_password/update_password_view.dart';
import 'package:mementum/modules/update_password_successful/update_password_successfull.dart';
import 'package:mementum/routes/app_pages.dart';

class AppRoutes {
  static final pages=[
    GetPage(name: AppPages.login, page: () => LogInView(),binding: LogInBinding()),
    GetPage(name: AppPages.signup, page: () => RequestAnInviteView(),binding: RequesstAnInviteBinding()),
    GetPage(name: AppPages.signupsecond, page: () => RequestAnInviteSecond(),binding: RequestAnInviteSecondBinding()),
    GetPage(name: AppPages.forgotpassword, page: ()=>ForgotPasswordView()),
    GetPage(name: AppPages.otppage, page: () => OtpPageView(),binding: OtpPageBinding()),
    GetPage(name: AppPages.updatepassword, page: () => UpdatePasswordView(),binding: UpdatePasswordBinding()),
    GetPage(name: AppPages.updatePasswordSuccessfull, page: () => UpdatePasswordSuccessfull(),),
    GetPage(name: AppPages.mainscreen, page: () => MainScreen(),binding: MainScreenBinding()),
    GetPage(name: AppPages.unlockmomentum, page: () => UnlockMomentumView(),)
  ];
}