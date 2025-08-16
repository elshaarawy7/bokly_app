import 'package:bokly_app/core/errors/filer.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, List<T>>> call([Param? param]);
}
