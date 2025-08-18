import 'package:bloc/bloc.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/usecase/fetch_futcher_books_usecase.dart';
import 'package:bokly_app/core/errors/filer.dart';
import 'package:meta/meta.dart';

part 'futcherd_books_state.dart';

class FutcherdBooksCubit extends Cubit<FutcherdBooksState>  {
  FutcherdBooksCubit(this.fetchFutcherBooksUsecase) : super(FutcherdBooksInitial()); 

  final FetchFutcherBooksUsecase fetchFutcherBooksUsecase ; 
  Future<void>fetchFutcherdBox() async{
    emit(FutcheredBooksLoding()) ; 
  var result = await fetchFutcherBooksUsecase.call() ;
  result.fold(
    (failure) => emit(FutcherBooksFuiler(failure.message)),
    (books) => emit(FutcherdBoksSacsess(books)),
  );
  }

}
