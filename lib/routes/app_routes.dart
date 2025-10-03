import 'package:get/get.dart';
import 'package:mementum/modules/log_in/log_in_view.dart';
import 'package:mementum/routes/app_pages.dart';

class AppRoutes {
  static final pages=[
    GetPage(name: AppPages.login, page: () => LogInView(),),
  ];
}