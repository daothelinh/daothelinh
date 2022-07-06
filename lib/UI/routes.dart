import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_ui_aicycle_seta/UI/auth_page.dart';
import 'package:login_ui_aicycle_seta/UI/new_page.dart';
import 'package:login_ui_aicycle_seta/binding/auth_binding.dart';
import 'package:login_ui_aicycle_seta/binding/repository_binding.dart';
import 'package:login_ui_aicycle_seta/binding/usecase_binding.dart';

class Routes {
  Routes._();

  static const String auth = '/auth';
  static const String registerVerify = '/register-verify';
  static const String home = '/home';
  static const String changePassword = '/change-password';
  static const String forgotPassword = '/forgot-password';
  static const String newpage = '/newpage';
  static final routes = [
    GetPage(
      name: auth,
      page: () => const AuthPage(),
      bindings: [
        RepositoryBinding(),
        UseCaseBinding(),
        AuthBindings(),
      ],
    ),
    // GetPage(
    //   name: newpage,
    //   page: () => NewPage(),
    // )
  ];
}
