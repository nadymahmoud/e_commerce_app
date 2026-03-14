import 'package:e_commerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:e_commerce_app/core/features/cart/cubit/card_cubit.dart';
import 'package:e_commerce_app/core/features/cart/repo/cart_repo.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/categories_cubit.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/product_cubit.dart';
import 'package:e_commerce_app/core/features/home_screen/repo/home_repo.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/utils/storage_helper.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  //Dio Helper
DioHelper dioHelper = DioHelper();
 // Repo
sl.registerSingleton<DioHelper>(dioHelper);
 // Cubit
 sl.registerLazySingleton( () => AuthRepo (sl<DioHelper>()));
  sl.registerLazySingleton( () => HomeRepo (sl<DioHelper>()));
    sl.registerLazySingleton( () => CartRepo (sl<DioHelper>()));



 // Cubit
 sl.registerFactory( () =>ProductCubit(sl< HomeRepo>  ()) );
  sl.registerFactory( () =>CategoriesCubit(sl< HomeRepo>  ()) );

 sl.registerFactory( () =>AuthCubit(sl< AuthRepo>  ()) );
  sl.registerFactory( () =>CardCubit(sl <CartRepo> ()) );


 // Storage
 sl.registerLazySingleton( () =>StorageHelper() );
 
} 