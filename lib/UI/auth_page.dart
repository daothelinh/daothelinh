import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/UI/login_page.dart';
import 'package:login_ui_aicycle_seta/controller/auth_controller.dart';
//import 'package:flutter/cupertino.dart';

import '../strings/strings.dart';

class AuthPage extends GetView<AuthController> {
  final double appBarHeight = 144;

  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: appBarHeight - 2,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          children: const <Widget>[
            Image(
              image: AssetImage('assets/images/auth_background.png'),
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 16,
          ),
          Text(
            AppStrings.welcomeText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              //fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: appbar,
        body: const LoginPage(),
      ),
    );
  }
}
