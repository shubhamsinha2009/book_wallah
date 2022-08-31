import 'package:hive/hive.dart';

import 'books.dart';

part 'subjects.g.dart';

@HiveType(typeId: 1)
class Subject extends HiveObject {
  @HiveField(0)
  final String subject;

  @HiveField(1)
  final List<Book> booksList;

  Subject({
    required this.subject,
    required this.booksList,
  });
}
