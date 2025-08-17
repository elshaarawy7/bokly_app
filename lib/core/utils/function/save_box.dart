 import 'package:bokly_app/Features/home/presentation/views/domin/entittes/book_entity.dart';
import 'package:hive/hive.dart';

void saveData(List<BookEntity> books  , String booksName) {
    var box = Hive.box(booksName) ; 
    box.addAll(books) ;
  }