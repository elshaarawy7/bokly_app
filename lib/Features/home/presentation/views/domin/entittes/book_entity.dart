class BookEntity {
  final String? image;
  final String title;
  final String book_id ;
  final String ? utherName;
  final num ? price, rating;

  BookEntity({
    required this.image,
    required this.title,
    required this.utherName,
    required this.price,
    required this.rating,
    required this.book_id ,
  });
}
