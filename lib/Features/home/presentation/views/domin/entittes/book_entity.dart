
 import 'package:hive/hive.dart';
 part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity {
  final String? image;
  @HiveField(0) 
  final String title;
  @HiveField(1) 
  final String book_id ; 
  @HiveField(2) 
  final String ? utherName;
  @HiveField(3) 
  final num ? price ; 
  @HiveField(4) 
   final num ? rating;
   @HiveField(5) 

  BookEntity({
    required this.image,
    required this.title,
    required this.utherName,
    required this.price,
    required this.rating,
    required this.book_id ,
  });
}
