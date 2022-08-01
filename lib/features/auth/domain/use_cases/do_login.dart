import 'package:either_dart/either.dart';
import 'package:login_ui_aicycle_seta/features/auth/domain/repositories/auth_repository.dart';
import 'package:login_ui_aicycle_seta/features/auth/data/models/auth_res.dart';
import 'package:login_ui_aicycle_seta/core/failures/failure.dart';

class DoLogin {
  final AuthRepository repository;
  DoLogin(this.repository);

  Future<Either<Failure, AuthRes>> call(
      {required String phoneNumber, required String password}) async {
    return await repository.doLogin(
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}
