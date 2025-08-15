import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/core/errors/filer.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo { 
  Future<Either<Failure, List<BookEntity>>> fetchFutcherBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}