import 'package:flutter/material.dart';
import 'package:login_ui_aicycle_seta/UI/password_resetter_page.dart';
import 'package:login_ui_aicycle_seta/controller/auth_controller.dart';
import 'package:login_ui_aicycle_seta/data/auth_res.dart';
import 'package:login_ui_aicycle_seta/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/strings/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _user = LocalStorageService().userInfo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        leading: const Icon(Icons.account_circle_rounded),
        leadingWidth: 70,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Text(
            "GĐV:${_user!.fullName}",
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'SVN-Gilroy',
              fontSize: 17,
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(' ${_user.fullName}'),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.lock),
                title: Text(
                  AppStrings.changePassword,
                  style: TextStyle(
                    fontFamily: 'SVN-Gilroy',
                    fontSize: 18,
                  ),
                ),
                // onTap: () {
                //   PasswordResetterPage();
                // },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text(
                  AppStrings.logOut,
                  style: TextStyle(
                    fontFamily: 'SVN-Gilroy',
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  logOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
