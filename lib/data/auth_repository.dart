import 'package:either_dart/either.dart';
import 'package:login_ui_aicycle_seta/data/auth_res.dart';
import 'package:login_ui_aicycle_seta/model/change_password_res.dart';
import 'package:login_ui_aicycle_seta/usecase/failure.dart';

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
