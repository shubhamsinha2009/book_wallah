import 'package:hive/hive.dart';

part 'links.g.dart';

@HiveType(typeId: 4)
class Linkurl extends HiveObject {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final String link;

  Linkurl({
    required this.number,
    required this.link,
  });
}
