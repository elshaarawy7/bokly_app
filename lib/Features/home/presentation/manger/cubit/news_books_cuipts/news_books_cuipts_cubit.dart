import 'package:bloc/bloc.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/usecase/fetch_futcher_books_usecase.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/usecase/fetch_news_books_usecase.dart';
import 'package:meta/meta.dart';

part 'news_books_cuipts_state.dart';

class NewsBooksCuiptsCubit extends Cubit<NewsBooksCuiptsState> {
  NewsBooksCuiptsCubit(this.fetchNewsBoxUsecase) : super(NewsBooksCuiptsInitial()); 

  final FetchNewsBooksUsecase fetchNewsBoxUsecase ;  

  Future<void> fetchNewsBox()async{
    emit(FutcNewsBooksLoding()); 
    var result = await fetchNewsBoxUsecase.call() ;

     result.fold(
    (failure) => emit(FutchedNewsBooksFuiler (failure.message)),
    (books) => emit(FutchNewsBoksSacsess(books)),
  );
  }
}
