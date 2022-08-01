import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/UI/password_resetter_page.dart';
import 'package:login_ui_aicycle_seta/routes.dart';
import 'package:login_ui_aicycle_seta/features/auth/presentation/controller/auth_controller.dart';
import 'package:login_ui_aicycle_seta/features/home/presentation/controller/home_controller.dart';
import 'package:login_ui_aicycle_seta/core/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/core/values/strings.dart';

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
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text(
                AppStrings.changePassword,
                style: TextStyle(
                  fontFamily: 'SVN-Gilroy',
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.changePassword);
              },
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
