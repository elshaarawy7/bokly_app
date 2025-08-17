part of 'futcherd_books_cubit.dart';

@immutable
sealed class FutcherdBooksState {}

final class FutcherdBooksInitial extends FutcherdBooksState {} 
final class FutcheredBooksLoding extends FutcherdBooksState{} 

final class FutcherBooksFuiler extends FutcherdBooksState{ 
  final errMassege ; 
  FutcherBooksFuiler(this.errMassege) ;
} 

final class FutcherdBoksSacsess extends FutcherdBooksState{
 final List <BookEntity>books ; 
 FutcherdBoksSacsess(this.books) ;
}
