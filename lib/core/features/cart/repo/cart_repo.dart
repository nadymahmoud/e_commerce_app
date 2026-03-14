import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/features/cart/models/card_model.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:e_commerce_app/core/networking/api_endpoints.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';

class CartRepo {
  final DioHelper _dioHelper;

  CartRepo(this._dioHelper);
  Future<Either<String, CartModel>> getUsersCart() async {
    try {
      final response = await _dioHelper.getData(
        endPoint: ApiEndpoints.cartEndPoint + "/user/2",
      );
      if (response.statusCode == 200) {
        CartModel cartModel = CartModel.fromJson(response.data[0]);
        return Right(cartModel);
      } else {
        return Left('semething went wrong');
      }
    } catch (e) {
      if (e is DioException) return Left(e.response.toString());
      return Left("internal error");
    }
  }

  Future<Either<String, CartModel>> addToCart({
    required String date,
    required ProductsModel product,
    required int quantity,
  }) async {
    try {
      final response = await _dioHelper.putData(
        endPoint: ApiEndpoints.cartEndPoint + "/3",
        data: {
          "date": date,
          "userId": 3,
          "products": [
            {"productId": product.id, "quantity": quantity},
          ],
        },
      );
      if (response.statusCode == 200) {
        CartModel cartModel = CartModel.fromJson(response.data);
        return Right(cartModel);
      } else {
        return Left('semething went wrong');
      }
    } catch (e) {
      if (e is DioException) return Left(e.response.toString());
      return Left("internal error");
    }
  }
}
