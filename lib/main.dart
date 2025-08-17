import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/Splash/presentation/views/splash_view.dart';

void main() async {
  await Hive.initFlutter() ;
  Hive.registerAdapter(BookEntityAdapter()) ;
  await  Hive.openBox<BookEntity>(KFutcherdBox);
  await Hive.openBox<BookEntity>(KnewsBox) ;
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
    );
  }
}
