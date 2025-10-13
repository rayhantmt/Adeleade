import 'package:get/get.dart';

class MemoriesController extends GetxController{
  var memorytype = 0.obs; // 0 = On-Time, 1 = Recurring Deposit

  void setDepositType(int type) {
    memorytype.value = type;
  }
}