import 'package:either_dart/either.dart';
import 'package:login_ui_aicycle_seta/features/auth/domain/repositories/auth_repository.dart';
import 'package:login_ui_aicycle_seta/features/home/data/models/change_password_res.dart';
import 'package:login_ui_aicycle_seta/core/failures/failure.dart';

class ChangePassword {
  final AuthRepository repository;
  ChangePassword(this.repository);

  Future<Either<Failure, ChangePasswordRes>> call(
      {required String phoneNumber, required String newPassword}) async {
    return repository.changePassword(
        phoneNumber: phoneNumber, newPassword: newPassword);
  }
}
