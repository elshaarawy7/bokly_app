import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';

abstract class HomeRepo { 
  Future<List<BookEntity>> fetchFutcherBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}