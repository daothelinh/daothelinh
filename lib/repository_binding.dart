import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/features/auth/domain/repositories/auth_repository.dart';
import 'package:login_ui_aicycle_seta/features/auth/data/repositories/auth_repository_impl.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
  }
}
