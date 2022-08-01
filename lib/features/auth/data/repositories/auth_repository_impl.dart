import 'package:either_dart/either.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:login_ui_aicycle_seta/core/values/endpoints.dart';
import 'package:login_ui_aicycle_seta/features/auth/domain/repositories/auth_repository.dart';
import 'package:login_ui_aicycle_seta/features/auth/data/models/auth_res.dart';
import 'package:login_ui_aicycle_seta/features/home/data/models/change_password_res.dart';
import 'package:login_ui_aicycle_seta/core/services/logger_service.dart';
import 'package:login_ui_aicycle_seta/core/failures/failure.dart';
import 'package:login_ui_aicycle_seta/restful/restful_module.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GetConnect getConnect;
  AuthRepositoryImpl(this.getConnect);

  @override
  Future<Either<Failure, AuthRes>> doLogin(
      {required String phoneNumber, required String password}) async {
    var body = {"phoneNumber": phoneNumber, "password": password};
    try {
      RestfulModule restfulModule = Get.find();

      var response = await restfulModule.post(Endpoints.login, body);
      if (response.statusCode == 404) {
        return Left(AuthFailure(message: response.body['message']));
      }
      var token = response.headers!['x-auth-token'] ?? "";
      await restfulModule.saveAuthToken(token);
      var result = response.body;
      return Right(AuthRes.fromJson(result));
    } catch (e, stacktrace) {
      logger.e('$e $stacktrace');
      return Left(SystemFailure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, AuthRes>> doRegister(
  //     {required String phoneNumber,
  //     required String province,
  //     required String fullName,
  //     required String password}) async {
  //   var body = {
  //     "phoneNumber": phoneNumber,
  //     "region": province,
  //     "fullName": fullName,
  //     "password": password
  //   };
  //   try {
  //     var response = await getConnect.post(Endpoints.register, body);
  //     var result = response.body;
  //     return Right(AuthRes.fromJson(result));
  //   } catch (e) {
  //     logger.e(e);
  //     return Left(SystemFailure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, ChangePasswordRes>> changePassword(
      {required String phoneNumber, required String newPassword}) async {
    try {
      var response = await getConnect.post(Endpoints.changePassword,
          {"phoneNumber": phoneNumber, "password": newPassword});
      var result = response.body;
      return Right(ChangePasswordRes.fromJson(result));
    } catch (e) {
      logger.e(e);
      return Left(SystemFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkExisted(
      {required String phoneNumber}) async {
    try {
      var response = await getConnect.post(Endpoints.checkExisted, {
        "phoneNumber": phoneNumber,
      });
      var result = response.body;
      return Right(result['existed']);
    } catch (e) {
      logger.e(e);
      return Left(SystemFailure(message: e.toString()));
    }
  }
}
