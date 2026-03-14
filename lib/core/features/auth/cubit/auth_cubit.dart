import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/features/auth/cubit/auth_state.dart';
import 'package:e_commerce_app/core/features/auth/model/login_response_model.dart';
import 'package:e_commerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  login({required String email, required String password}) async {
    emit(LoadingAuthState());
    final Either<String, LoginResponseModel> res = await _authRepo.login(
      email,
      password,
    );
    res.fold((errer) {
      emit(ErrorAuthState(errer));
    }, (right){
      emit( SuccessAuthState( "Login Success" ));
    });
  }
}
