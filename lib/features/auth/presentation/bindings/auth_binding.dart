import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/features/home/presentation/controller/change_password_controller.dart';
import 'package:login_ui_aicycle_seta/features/auth/presentation/widgets/login/controller/login_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        // changePassword: Get.find(),
        doLogin: Get.find(),
        //getDamageTypes: Get.find(),
      ),
    );
    Get.lazyPut(() => ChangePasswordController(changePassword: Get.find()));
  }
}
