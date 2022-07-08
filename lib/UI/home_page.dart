import 'package:flutter/material.dart';
import 'package:login_ui_aicycle_seta/controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {
              logOut();
            },
            child: const Text("Log Out")),
      ),
    );
  }
}
