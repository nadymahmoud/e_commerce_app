import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/features/auth/model/login_response_model.dart';
import 'package:e_commerce_app/core/networking/api_endpoints.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/core/utils/storage_helper.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(  this._dioHelper );
  Future<Either<String, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await  _dioHelper.postData(
        endPoint: ApiEndpoints.loginEndPoint,
        data: {"username": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data,
        );
        await sl<StorageHelper>().saveToken(loginResponseModel.token);
        return Right(loginResponseModel);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      if (e is DioException) return Left(e.response.toString());
      return Left("internal error");
    }
  }
}
