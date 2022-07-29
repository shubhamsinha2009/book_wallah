import 'package:books_wallah/app/data/model/chapter.dart';

class Book {
  final String bookName;
  final String className;
  final String subject;
  final List<Chapter> chapters;

  Book({
    required this.bookName,
    required this.className,
    required this.subject,
    required this.chapters,
  });
}
