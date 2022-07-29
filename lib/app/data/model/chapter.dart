import 'package:books_wallah/app/data/model/links.dart';

class Chapter {
  final String chapterName;
  final List<Link> links;
  // final String fileSize;

  Chapter({
    required this.chapterName,
    required this.links,
    // required this.fileSize,
  });
}
