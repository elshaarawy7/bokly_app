import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/repos/home_repo.dart';
import 'package:bokly_app/core/errors/filer.dart';
import 'package:bokly_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

// ===== UseCase Base Class =====

// ===== No Parameter Class =====
class NoPramter {}

// ===== Fetch Future Books Use Case =====
class FetchNewsBooksUsecase extends UseCase<BookEntity, NoPramter> {
  final HomeRepo homeRepo;

  FetchNewsBooksUsecase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoPramter? param]) async {
    return await homeRepo.fetchNewsBooks();
  }
}
