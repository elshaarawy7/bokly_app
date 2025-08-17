import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';

abstract class HomeRemoteDataSouorce {
   Future<List<BookEntity>> etchFutcherBooks(); 
   Future<List<BookEntity>> fetchNewsBooks(); 
} 

class HomeRemoteDataSourceImpl extends HomeRemoteDataSouorce{
  @override
  Future<List<BookEntity>> etchFutcherBooks() {
    // TODO: implement etchFutcherBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() {
    // TODO: implement fetchNewsBooks
    throw UnimplementedError();
  }

}