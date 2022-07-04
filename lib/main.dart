import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'UI/auth_page.dart';
import 'UI/routes.dart';

void main() {
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
    Get.put<GetConnect>(GetConnect());
  }
}
