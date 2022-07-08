import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/UI/routes.dart';
import 'package:login_ui_aicycle_seta/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/services/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logOut() async {
  // var auth = FirebaseAuth.instance;
  var sharedPreferenceHelper = await SharedPreferences.getInstance();
  try {
    // await auth.signOut();
    await sharedPreferenceHelper.clear();
    LocalStorageService().removeAll();
    Get.offAllNamed(Routes.auth);
  } catch (e) {
    Snackbar.show(type: SnackbarType.error, message: e.toString());
  }
}

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final PageController pageController = PageController();
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  void onTabTapped(int index) {
    pageController.jumpToPage(index);
  }
}
