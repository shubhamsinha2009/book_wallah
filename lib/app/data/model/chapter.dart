import 'package:books_wallah/app/data/model/links.dart';
import 'package:hive/hive.dart';

part 'chapter.g.dart';

@HiveType(typeId: 3)
class Chapter extends HiveObject {
  @HiveField(0)
  final String chapterName;

  @HiveField(1)
  final List<Linkurl> links;
  // final String fileSize;

  Chapter({
    required this.chapterName,
    required this.links,
    // required this.fileSize,
  });
}
