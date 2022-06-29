


import 'package:either_dart/either.dart';
import 'package:login_ui_aicycle_seta/data/auth_repository.dart';
import 'package:login_ui_aicycle_seta/data/auth_res.dart';
import 'package:login_ui_aicycle_seta/usecase/failure.dart';

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