import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_local_data_source.dart';
import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_remote_data_souorce.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/repos/home_repo.dart';
import 'package:bokly_app/core/errors/filer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class HomeRepoImpl extends HomeRepo {
    final HomeRemoteDataSouorce homeremoteDataSouorce ; 
    final HomeLocalDataSource homelocalDataSource ; 
   HomeRepoImpl({required this.homeremoteDataSouorce , required this.homelocalDataSource}) ;
  Future<Either<Failure, List<BookEntity>>> fetchFutcherBooks()  async {
  
   try {
      final bookList = await homelocalDataSource.fetchFutcherBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      } 
    
    var books = await homeremoteDataSouorce.fetchFutcherBooks() ;
    return right(books);
     
   } catch (e) {
     return left(Failure()) ;
   }
   
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBooks() async {
     try {
       final bookList = await homelocalDataSource.fetchNewsBooks(); 
       if(bookList.isEmpty){
        return right(bookList) ; 
       } 
       final book = await homelocalDataSource.fetchNewsBooks(); 
       return right(book) ;
     } catch (e) {
       return left(Failure()) ;
     }
  }
}