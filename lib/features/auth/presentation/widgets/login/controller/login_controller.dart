import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/UI/routes.dart';
import 'package:login_ui_aicycle_seta/data/auth_res.dart';
import 'package:login_ui_aicycle_seta/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/services/logger_service.dart';
import 'package:login_ui_aicycle_seta/services/process_usecase.dart';
import 'package:login_ui_aicycle_seta/services/snackbar.dart';
import 'package:login_ui_aicycle_seta/usecase/do_login.dart';
import 'package:login_ui_aicycle_seta/usecase/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final DoLogin doLogin;
  //final ChangePassword changePassword;
  //final GetDamageTypes getDamageTypes;
  LoginController({
    required this.doLogin,
    changePassword,
    //required this.changePassword,
    //required this.getDamageTypes,
  });
  //login-page
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var tokenLogin = ''.obs;
  late Rx<AuthRes?> loginRes;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loginRes = Rx<AuthRes?>(null);
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferenceHelper sharedPreferenceHelper = Get.find();
    var userName = await sharedPreferenceHelper.getUserName;
    var password = await sharedPreferenceHelper.getPassword;
    if (userName != null && password != null) {
      usernameController.text = userName;
      passwordController.text = password;
      doLoginUser(phoneNumber: userName, password: password);
    }
  }

  // Future<void> doGetDamageTypes() async {
  //   var result = await getDamageTypes();

  //   await processUsecaseResult(
  //     result: result,
  //     onSuccess: (data) {
  //       LocalStorageService().saveDamageTypes(data);
  //     },
  //   );
  // }

  void doLoginUser(
      {required String phoneNumber, required String password}) async {
    if (loading.value) return;

    SharedPreferenceHelper sharedPreferenceHelper = Get.find();
    try {
      loading.value = true;
      var result = await doLogin(phoneNumber: phoneNumber, password: password);
      await processUsecaseResult(
        result: result,
        onSuccess: (res) {
          if (res is AuthRes) {
            loginRes.value = res;
            LocalStorageService().saveUserInfo(res.assessorInfo);
            //doGetDamageTypes();
            sharedPreferenceHelper.saveUserName(phoneNumber);
            sharedPreferenceHelper.savePassword(password);

            Get.offAllNamed(Routes.home);
            Snackbar.show(type: SnackbarType.success, message: res.msg);
          }
        },
        shouldShowFailure: (p0) => true,
      );
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }

  doLogout() async {
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
}
