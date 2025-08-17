import 'package:bloc/bloc.dart';
import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:meta/meta.dart';

part 'futcherd_books_state.dart';

class FutcherdBooksCubit extends Cubit<FutcherdBooksState> {
  FutcherdBooksCubit() : super(FutcherdBooksInitial());
}
