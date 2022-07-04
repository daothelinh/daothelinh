import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:login_ui_aicycle_seta/model/restful/restful_module.dart';
import 'package:login_ui_aicycle_seta/model/restful/restful_module_impl.dart';
import 'package:login_ui_aicycle_seta/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/usecase/shared_preferences.dart';
import 'UI/auth_page.dart';
import 'UI/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // await Firebase.initializeApp();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.routes,
      initialRoute: Routes.auth,
      initialBinding: InitialBindings(),
      home: const AuthPage(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Logger>(Logger());

    Get.put<RestfulModule>(RestfulModuleImpl());
    Get.put<GetConnect>(GetConnect());
    Get.put<SharedPreferenceHelper>(SharedPreferenceHelper(), permanent: true);
    Get.put<LocalStorageService>(LocalStorageService());
  }
}
