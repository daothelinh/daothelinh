import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/data/auth_repository.dart';
import 'package:login_ui_aicycle_seta/model/repositories/auth_repository_impl.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
  }
}
