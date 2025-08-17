import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity>  etchFutcherBooks(); 
  List<BookEntity> fetchNewsBooks();
} 

class HomeDataSourceImpl extends HomeLocalDataSource{
  
}