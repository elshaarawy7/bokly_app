part of 'news_books_cuipts_cubit.dart';

@immutable
sealed class NewsBooksCuiptsState {}

final class NewsBooksCuiptsInitial extends NewsBooksCuiptsState {} 

final class FutcNewsBooksLoding extends NewsBooksCuiptsState{} 

final class FutchedNewsBooksFuiler extends NewsBooksCuiptsState{ 
  final errMassege ; 
  FutchedNewsBooksFuiler(this.errMassege) ;

} 

final class FutchNewsBoksSacsess extends NewsBooksCuiptsState{
 final List <BookEntity>books ; 
 FutchNewsBoksSacsess(this.books) ;
}

