 import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class  LoadingProductState extends ProductState {}

class  ErrorProductState extends ProductState {
  final String message;
  ErrorProductState(this.message);
}

class  SuccessProductState extends ProductState {
  final List<ProductsModel> productsModel;
  SuccessProductState(this.productsModel);
}