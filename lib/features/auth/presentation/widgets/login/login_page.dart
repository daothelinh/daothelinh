//import 'package:aicycle_login_seta/string/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/routes.dart';
import 'package:login_ui_aicycle_seta/common_field/common_button.dart';
import 'package:login_ui_aicycle_seta/common_field/common_textfield.dart';
import 'package:login_ui_aicycle_seta/features/auth/presentation/widgets/login/controller/login_controller.dart';
import 'package:login_ui_aicycle_seta/core/values/strings.dart';
//import '../controller/login_controller.dart';
//import 'common_field.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  //final usernameController = Get.find<LoginController>();
  // Future signIn() async{
  //   await baseUrl.;
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Container(
        height: Get.height,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Container(
                    //   height: 50,
                    //   width: 350,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10.0)),
                    // child:
                    CommonTextFormField(
                      // style: const TextStyle(
                      //   fontSize: 17,
                      // ),
                      controller: controller.usernameController,
                      keyboardType: TextInputType.phone,
                      //decoration: const InputDecoration(
                      hintText: AppStrings.phone,
                      //border: InputBorder.none,
                      //contentPadding: EdgeInsets.all(20),
                      //),
                      validator: (String? string) {
                        if (string!.isEmpty) {
                          return AppStrings.errorEmpty;
                        }
                        if (string.length < 9 || string.length > 11) {
                          return AppStrings.errorPhone;
                        }
                        return null;
                      },
                    ),
                    //),
                    const SizedBox(
                      height: 16.0,
                    ),
                    // Container(
                    //   height: 50,
                    //   width: 350,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //child:
                    CommonTextFormField(
                      controller: controller.passwordController,
                      // style: const TextStyle(
                      //   fontSize: 17,
                      // ),
                      keyboardType: TextInputType.text,
                      //decoration: const InputDecoration(
                      hintText: AppStrings.password,
                      //border: InputBorder.none,
                      //contentPadding: EdgeInsets.all(20),
                      // ),
                      obscureText: true,
                      validator: (String? string) {
                        if (string!.isEmpty) {
                          return AppStrings.errorEmpty;
                        }
                        if (string.length < 6) {
                          return AppStrings.errorPassword;
                        }
                        return null;
                      },
                    ),
                    //)
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(9.0),
              child: SizedBox(
                height: 50,
                width: double.maxFinite,
                child: CupertinoButton(
                  child: Text(
                    AppStrings.forgetPassword,
                    style: TextStyle(
                      color: Color.fromARGB(255, 123, 54, 137),
                    ),
                  ),
                  onPressed: null,
                  //  () {
                  //   Get.toNamed(Routes.forgotPassword);
                  // },
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            //(() => FlatButton(onPressed: null, child: Text("Đăng Nhập")))
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => CommonButton(
                onPressed: () {
                  controller.doLoginUser(
                      phoneNumber: controller.usernameController.text,
                      password: controller.passwordController.text);
                },
                text: AppStrings.logIn,
                child: controller.loading.isTrue
                    ? const Center(
                        child: CupertinoActivityIndicator(
                          animating: false,
                        ),
                      )
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
