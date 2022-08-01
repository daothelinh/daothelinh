import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:login_ui_aicycle_seta/features/auth/presentation/controller/auth_controller.dart';
import 'package:login_ui_aicycle_seta/core/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/services/process_usecase.dart';
import 'package:login_ui_aicycle_seta/services/snackbar.dart';
import 'package:login_ui_aicycle_seta/features/home/domain/usecases/change_password.dart';

class ChangePasswordController extends GetxController {
  final ChangePassword changePassword;
  ChangePasswordController({required this.changePassword});

  final TextEditingController curPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reNewPasswordController = TextEditingController();

  void doChangePassword({required String newPassword}) async {
    var result = await changePassword(
      phoneNumber: LocalStorageService().userInfo!.phoneNumber!,
      newPassword: newPassword,
    );
    processUsecaseResult(
      result: result,
      onSuccess: (res) {
        Snackbar.show(type: SnackbarType.success, message: res.msg);
        logOut();
      },
      shouldShowFailure: (p0) => true,
    );
  }
}
