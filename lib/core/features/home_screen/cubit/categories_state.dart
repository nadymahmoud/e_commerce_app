 abstract class  CategoriesState {}

class InitialCategoriesState extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class ErrorCategoriesState extends CategoriesState {
  final String errorMessage;

  ErrorCategoriesState(this.errorMessage);
}

class SuccessCategoriesState extends CategoriesState {
  final List<String> categories;

  SuccessCategoriesState(this.categories);
}