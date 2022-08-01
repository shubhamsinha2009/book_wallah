import 'package:books_wallah/app/data/provider/class10/subjects/civics.dart';
import 'package:books_wallah/app/data/provider/class10/subjects/economics.dart';
import 'package:books_wallah/app/data/provider/class10/subjects/geography.dart';
import 'package:books_wallah/app/data/provider/class10/subjects/history.dart';

import '../../model/subjects.dart';
import 'subjects/math.dart';
import 'subjects/science.dart';

List<Subject> class10 = [
  Subject(subject: 'Mathematics', booksList: maths),
  Subject(subject: 'Science', booksList: science),
  Subject(subject: 'History', booksList: history),
  Subject(subject: 'Civics', booksList: civics),
  Subject(subject: 'Economics', booksList: economics),
  Subject(subject: 'Geography', booksList: geography),
];
