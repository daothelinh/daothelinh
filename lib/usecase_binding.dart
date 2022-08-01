import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/features/home/domain/usecases/change_password.dart';
import 'package:login_ui_aicycle_seta/features/auth/domain/use_cases/do_login.dart';

class UseCaseBinding extends Bindings {
  @override
  void dependencies() {
    //auth
    Get.lazyPut(() => DoLogin(Get.find()));
    Get.lazyPut(() => ChangePassword(Get.find()));
  }
}
