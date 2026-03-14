import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/features/home_screen/models/categories_model.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:e_commerce_app/core/networking/api_endpoints.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);

  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final response = await _dioHelper.getData(
        endPoint: ApiEndpoints.productsEndPoint,
      );
      if (response.statusCode == 200) {
        List<ProductsModel> productsModel = productModelFromJson(response.data);
        return Right(productsModel);
      } else {
        return Left('semething went wrong');
      }
    } catch (e) {
      if (e is DioException) return Left(e.response.toString());
      return Left("internal error");
    }
  }

  Future<Either<String, List<ProductsModel>>> getProductsCategories(
    String productName,
  ) async {
    try {
      final response = await _dioHelper.getData(
        endPoint: ApiEndpoints.catProductsEndPoint + "/$productName",
      );
      if (response.statusCode == 200) {
        List<ProductsModel> productsModel = productModelFromJson(response.data);
        return Right(productsModel);
      } else {
        return Left('semething went wrong');
      }
    } catch (e) {
      if (e is DioException) return Left(e.response.toString());
      return Left("internal error");
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await _dioHelper.getData(
        endPoint: ApiEndpoints.categoriesEndPoint,
      );
      if (response.statusCode == 200) {
        List<String> productsModel = categoriesModelFromJson(response.data);
        productsModel.insert(0, "All");

        return Right(productsModel);
      } else {
        return Left('semething went wrong');
      }
    } catch (e) {
      if (e is DioException) return Left(e.response.toString());
      return Left("internal error");
    }
  }
}
