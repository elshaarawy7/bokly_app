import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_local_data_source.dart';
import 'package:bokly_app/Features/home/data/model/book_model/data_sources/home_remote_data_souorce.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/repos/home_repo.dart';
import 'package:bokly_app/core/errors/filer.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSouorce homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFutcherBooks() async {
    try {
      final bookList = await homeLocalDataSource.fetchFutcherBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }

      var books = await homeRemoteDataSource.fetchFutcherBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(message: '$e'));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBooks() async {
    try {
      var books = await homeLocalDataSource.fetchNewsBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(message: '$e'));
      }
    }
  }
}

