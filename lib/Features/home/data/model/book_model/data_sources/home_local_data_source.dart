import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity>  fetchFutcherBooks(); 
  List<BookEntity> fetchNewsBooks();
} 

class HomeDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFutcherBooks() {
    var box = Hive.box<BookEntity>(KFutcherdBox) ;
    return box.values.toList() ;
  }

  @override
  List<BookEntity> fetchNewsBooks() {
     var box = Hive.box<BookEntity>(KnewsBox) ;
    return box.values.toList() ;
  }

}