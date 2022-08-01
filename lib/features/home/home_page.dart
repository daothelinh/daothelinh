import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/features/home/presentation/widgets/drawer.dart';
import 'package:login_ui_aicycle_seta/features/home/presentation/controller/home_controller.dart';
import 'package:login_ui_aicycle_seta/core/services/local_storage_service.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _user = LocalStorageService().userInfo;

    final appBar = AppBar(
      elevation: 0.0,
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
    );
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: appBar,
        //body: body,
        endDrawer: PersonDrawer(),
        //bottomNavigationBar: bottomButton,
      ),
    );
  }
}
