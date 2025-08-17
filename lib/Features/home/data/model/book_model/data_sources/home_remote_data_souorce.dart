import 'package:bokly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/core/utils/api_serves.dart';

abstract class HomeRemoteDataSouorce {
   Future<List<BookEntity>> fetchFutcherBooks(); 
   Future<List<BookEntity>> fetchNewsBooks(); 
} 

class HomeRemoteDataSourceImpl extends HomeRemoteDataSouorce{
   final ApiServes apiServes ;

  HomeRemoteDataSourceImpl( this.apiServes);
  Future<List<BookEntity>> fetchFutcherBooks() async {
    var data = await apiServes.get(endBiond: 'volumes?filtering=free-ebooks&q=programming') ;

    List<BookEntity> books = getBooksList(data); 
    return books ;
  }

  

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
      var data = await apiServes.get(endBiond: 'volumes?filtering=free-ebooks&sorting=newest&q=programming') ;

    List<BookEntity> books = getBooksList(data); 
    return books ;
  } 

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [] ; 
    
    for(var bookMap in data['items']){
      books.add(BookModel.fromJson(bookMap)) ;
    }
    return books;
  }

}