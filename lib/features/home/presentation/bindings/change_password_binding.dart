import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/controller/change_password_controller.dart';

class ChangePassWordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController(changePassword: Get.find()));
  }
}
