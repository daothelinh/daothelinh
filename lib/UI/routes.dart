import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_ui_aicycle_seta/UI/auth_page.dart';
import 'package:login_ui_aicycle_seta/binding/auth_binding.dart';

class Routes {
  Routes._();
 
  static const String auth = '/auth';
  static const String registerVerify = '/register-verify';
  static const String home = '/home';
  static const String folder = '/folder';
  static const String folderEngineMode = '/folder-engine-mode';
  static const String camera = '/camera';
  static const String changePassword = '/change-password';
  static const String forgotPassword = '/forgot-password';
  static const String imagePainter = '/image-painter';
  static const String cameraTestEngine = '/camera-test-engine';
 
  static const String damageAssessment = '/damage-assessment';
  static const String annotate = '/annotate';
  static const String collectAnnotate = '/collect-annotate';
  static const String aiModeClaim = '/ai-mode-claim';
  static const String aiModeCamera = '/ai-mode-camera';
  static const String aiModePartDetails = '/ai-mode-part-details';
 
  static final routes = [
    GetPage(
      name: auth,
      page: () => const AuthPage(),
      bindings: [
        // RepositoryBinding(),
        // UseCaseBinding(),
        AuthBindings(),
      ],
    ),
  ];
}
