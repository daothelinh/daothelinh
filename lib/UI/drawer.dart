import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/controller/auth_controller.dart';
import 'package:login_ui_aicycle_seta/controller/home_controller.dart';
import 'package:login_ui_aicycle_seta/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/strings/strings.dart';

class PersonDrawer extends GetView<HomeController> {
  PersonDrawer({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    var _user = LocalStorageService().userInfo;
    // buttonText({});
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(' ${_user?.fullName}'),
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
    );
  }
}
