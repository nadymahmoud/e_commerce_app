import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/product_state.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:e_commerce_app/core/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit( this._repo) : super(ProductInitial());
  final HomeRepo _repo;

  void fetchProducts() async {
    emit(LoadingProductState());
    final Either<String, List<ProductsModel>> result = await _repo.getProducts();
    result.fold((l) => emit(ErrorProductState(l)), (r) => emit(SuccessProductState(r)));
  }

  void fetchProductsCategories(String productName) async {
    emit(LoadingProductState());
    final Either<String, List<ProductsModel>> result = await _repo.getProductsCategories(productName);
    result.fold((l) => emit(ErrorProductState(l)), (r) => emit(SuccessProductState(r)))
    ;}
}
