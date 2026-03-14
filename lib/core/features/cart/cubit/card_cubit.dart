 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/features/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/core/features/cart/models/card_model.dart';
import 'package:e_commerce_app/core/features/cart/repo/cart_repo.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CartState> {
  CardCubit( this._cartRepo) : super(CartInitial());

  final CartRepo _cartRepo  ;
  fetchCart() async {
    emit(LoadingCartState());
    final Either<String, CartModel> result = await _cartRepo.getUsersCart();
    result.fold((l) => emit(ErrorCartState(l)), (r) => emit(SuccessCartState(r)));
  }
   AddingToCart({required ProductsModel product , required int quantity} ) async {
    emit(AddingToCartState());
    DateTime  dateTime = DateTime.now();
    final  Either<String, CartModel>  result = await _cartRepo.addToCart( date: dateTime.toString(), product: product, quantity: quantity);
    result.fold((l) => emit(ErrorAddingToCartState(l)), (r) => emit(SuccessAddingToCartState(r)));}
}