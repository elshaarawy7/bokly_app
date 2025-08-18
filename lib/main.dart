import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_local_data_source.dart';
import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_remote_data_souorce.dart';
import 'package:bokly_app/Features/home/presentation/manger/cubit/futcherd_books_cubit.dart';
import 'package:bokly_app/Features/home/presentation/manger/cubit/news_books_cuipts/news_books_cuipts_cubit.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/repos/home_repo_impl.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/usecase/fetch_futcher_books_usecase.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/usecase/fetch_news_books_usecase.dart';
import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/api_serves.dart';
import 'package:bokly_app/core/utils/app_router.dart';
import 'package:bokly_app/core/utils/function/set_up_serves_locatoer.dart';
import 'package:bokly_app/core/utils/simple_bloc_opserver.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter() ;
  Hive.registerAdapter(BookEntityAdapter( 
    
  )) ;
  set_up_servies_locator();
  await  Hive.openBox<BookEntity>(KFutcherdBox);
  await Hive.openBox<BookEntity>(KnewsBox) ; 
  Bloc.observer = SimpleBlocOpserver() ;
  runApp(const Bookly());
}





class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
  create: (context) {
    return FutcherdBooksCubit(
      FetchFutcherBooksUsecase(
       getIt.get<HomeRepoImpl>() ,
      ),
    );
  },
), 

        BlocProvider(
  create: (context) {
    return NewsBooksCuiptsCubit(
      FetchNewsBooksUsecase(
        getIt.get<HomeRepoImpl>() ,
      ),
    );
  },
),

      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      ),
    );
  }
}
