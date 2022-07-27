import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/usecase/change_password.dart';
import 'package:login_ui_aicycle_seta/usecase/do_login.dart';

class UseCaseBinding extends Bindings {
  @override
  void dependencies() {
    //auth
    Get.lazyPut(() => DoLogin(Get.find()));
    Get.lazyPut(() => ChangePassword(Get.find()));
  }
}
