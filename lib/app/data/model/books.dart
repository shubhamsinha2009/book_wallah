import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:hive/hive.dart';

part 'books.g.dart';

@HiveType(typeId: 2)
class Book extends HiveObject {
  @HiveField(0)
  final String bookName;

  @HiveField(1)
  final String className;

  @HiveField(2)
  final String subject;

  @HiveField(3)
  final List<Chapter> chapters;

  Book({
    required this.bookName,
    required this.className,
    required this.subject,
    required this.chapters,
  });
}
