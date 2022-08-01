import 'package:either_dart/either.dart';
import 'package:login_ui_aicycle_seta/features/auth/data/models/auth_res.dart';
import 'package:login_ui_aicycle_seta/features/home/data/models/change_password_res.dart';
import 'package:login_ui_aicycle_seta/core/failures/failure.dart';

import '../../data/models/auth_res.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthRes>> doLogin(
      {required String phoneNumber, required String password});
  // Future<Either<Failure, AuthRes>> doRegister(
  //     {required String phoneNumber,
  //     required String province,
  //     required String fullName,
  //     required String password});
  Future<Either<Failure, ChangePasswordRes>> changePassword(
      {required String phoneNumber, required String newPassword});
  Future<Either<Failure, bool>> checkExisted({required String phoneNumber});
}
