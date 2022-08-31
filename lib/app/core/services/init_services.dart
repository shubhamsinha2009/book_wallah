import 'package:hive_flutter/hive_flutter.dart';

import '../../data/model/books.dart';
import '../../data/model/chapter.dart';
import '../../data/model/classes.dart';
import '../../data/model/links.dart';
import '../../data/model/subjects.dart';

Future<void> initServices() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ClassAdapter());
  Hive.registerAdapter(BookAdapter());
  Hive.registerAdapter(ChapterAdapter());
  Hive.registerAdapter(LinkurlAdapter());
  Hive.registerAdapter(SubjectAdapter());
  await Hive.openBox('settings');
  await Hive.openBox('user');
  await Hive.openBox('pdf');
}
