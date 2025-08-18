import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_local_data_source.dart';
import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_remote_data_souorce.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/repos/home_repo_impl.dart';
import 'package:bokly_app/core/utils/api_serves.dart';
import 'package:bokly_app/main.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void set_up_servies_locator() {
  getIt.registerSingleton<ApiServes>(
    ApiServes(Dio() , 
     ) , 
    );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiServes>() , 
      ),
    ),
  );
}
