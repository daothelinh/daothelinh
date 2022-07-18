import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/common_field/common_button.dart';
import 'package:login_ui_aicycle_seta/common_field/common_textfield.dart';
import 'package:login_ui_aicycle_seta/controller/change_password_controller.dart';
import 'package:login_ui_aicycle_seta/strings/strings.dart';

// ignore: must_be_immutable
class PasswordResetterPage extends GetView<ChangePasswordController> {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool forceLogout = false;

  PasswordResetterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      centerTitle: true,
      title: const Text(
        AppStrings.changePassword,
        style: TextStyle(
          fontFamily: 'SVN-Gilroy',
          fontSize: 18,
        ),
      ),
      leading: CupertinoButton(
        onPressed: (() {
          Get.back();
        }),
        child: const Icon(Icons.keyboard_backspace_outlined),
      ),
    );
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(AppStrings.createNewPassword),
                          const SizedBox(
                            height: 24,
                          ),
                          _buildCurrentInput(),
                          const SizedBox(height: 8),
                          _buildNewInput(),
                          const SizedBox(height: 8),
                          _buildConfirmInput(),
                        ],
                      ),
                    ),
                  ),
                  CommonButton(
                    onPressed: _runUpdatePassword,
                    text: AppStrings.doneNewPassword,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCurrentInput() {
    return CommonTextFormField(
      controller: controller.curPasswordController,
      labelText: AppStrings.passwordNow,
    );
  }

  _buildNewInput() {
    return CommonTextFormField(
      controller: controller.newPasswordController,
      labelText: AppStrings.newPassword,
      obscureText: true,
      validator: (str) {
        if (str!.isEmpty) {
          return AppStrings.errorEmpty;
        }
        if (str.length < 6) {
          return AppStrings.errorPassword;
        }
        return null;
      },
    );
  }

  _buildConfirmInput() {
    return CommonTextFormField(
      controller: controller.reNewPasswordController,
      labelText: AppStrings.rewriteNewPassword,
      obscureText: true,
      validator: (str) {
        if (str!.isEmpty) {
          return AppStrings.errorEmpty;
        }
        if (controller.newPasswordController.text !=
            controller.reNewPasswordController.text) {
          return AppStrings.confirmPasswordError;
        }
        return null;
      },
    );
  }

  _runUpdatePassword() async {
    if (_formKey.currentState!.validate()) {
      controller.doChangePassword(
          newPassword: controller.newPasswordController.text);
    }
  }
}
