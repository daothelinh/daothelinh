import 'package:either_dart/either.dart';
import 'package:login_ui_aicycle_seta/data/auth_repository.dart';
import 'package:login_ui_aicycle_seta/model/change_password_res.dart';
import 'package:login_ui_aicycle_seta/usecase/failure.dart';

class ChangePassword {
  final AuthRepository repository;
  ChangePassword(this.repository);

  Future<Either<Failure, ChangePasswordRes>> call(
      {required String phoneNumber, required String newPassword}) async {
    return repository.changePassword(
        phoneNumber: phoneNumber, newPassword: newPassword);
  }
}
