import 'package:hive/hive.dart';
import 'subjects.dart';

part 'classes.g.dart';

@HiveType(typeId: 0)
class Class extends HiveObject {
  @HiveField(0)
  final String classNumber;

  @HiveField(1)
  final List<Subject> subjectList;

  Class({
    required this.subjectList,
    required this.classNumber,
  });
}
