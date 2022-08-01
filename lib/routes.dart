import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_ui_aicycle_seta/features/auth/presentation/auth_page.dart';
import 'package:login_ui_aicycle_seta/features/home/home_page.dart';
import 'package:login_ui_aicycle_seta/features/home/presentation/widgets/password_resetter_page.dart';
import 'package:login_ui_aicycle_seta/features/auth/presentation/bindings/auth_binding.dart';
import 'package:login_ui_aicycle_seta/repository_binding.dart';
import 'package:login_ui_aicycle_seta/repository_binding.dart';
import 'package:login_ui_aicycle_seta/usecase_binding.dart';

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
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
    GetPage(name: forgotPassword, page: () => const HomePage()),
    GetPage(
        name: changePassword,
        page: () => PasswordResetterPage(),
        bindings: [
          RepositoryBinding(),
          UseCaseBinding(),
          AuthBindings(),
        ])
  ];
}
