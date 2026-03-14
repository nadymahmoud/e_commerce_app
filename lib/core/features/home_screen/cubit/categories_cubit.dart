import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/categories_state.dart';
import 'package:e_commerce_app/core/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(InitialCategoriesState());

  final HomeRepo _homeRepo;
  void fetchCategories() async {
    emit(LoadingCategoriesState());
    final Either<String, List<String>> result = await _homeRepo.getCategories();
    result.fold(
      (l) {
        emit(ErrorCategoriesState(l));
      },
      (r) {
         emit(SuccessCategoriesState(r));
      },
    );
  }
}
