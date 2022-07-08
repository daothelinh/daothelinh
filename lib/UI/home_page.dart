import 'package:flutter/material.dart';
import 'package:login_ui_aicycle_seta/controller/auth_controller.dart';
import 'package:login_ui_aicycle_seta/data/auth_res.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        leading: const Icon(Icons.account_circle_rounded),
        leadingWidth: 70,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Text(
            "GĐV:  $AssessorInfo.fullName",
            style: TextStyle(
              fontFamily: 'SVN-Gilroy',
              fontSize: 15,
            ),
          ),
        ),
      ),
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
