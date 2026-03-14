import 'package:e_commerce_app/core/features/cart/models/card_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class LoadingCartState extends CartState {}

class ErrorCartState extends CartState {
  final String message;
  ErrorCartState(this.message);
}

class SuccessCartState extends CartState {
  final CartModel cartModel;
  SuccessCartState(this.cartModel);
}

class AddingToCartState extends CartState {}

class   ErrorAddingToCartState extends CartState {
  final String message;
  ErrorAddingToCartState(this.message);
} 

class   SuccessAddingToCartState extends CartState {
  final CartModel cartModel;
  SuccessAddingToCartState(this.cartModel);
}
