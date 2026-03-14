import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
    Dio? dio;
    DioHelper (){
       dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
    }
    

    getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio!.get(
        endPoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

    postData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response;
    } catch (e) {
     rethrow;  
    }
  }

   putData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio!. put(endPoint, data: data);
      return response;
    } catch (e) {
     rethrow;  
    }
  }
}
