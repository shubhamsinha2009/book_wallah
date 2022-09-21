import 'package:books_wallah/app/data/model/classes.dart';

import 'bsc_electronics/class.dart';
import 'class10/class.dart';
import 'class11/class.dart';
import 'class12/class.dart';
import 'class6/class.dart';
import 'class7/class.dart';
import 'class8/class.dart';
import 'class9/class.dart';
import 'jee_neet/jee_neet.dart';

List<Class> classList = [
  Class(subjectList: class12, classNumber: 'Class 12'),
  Class(subjectList: class11, classNumber: 'Class 11'),
  Class(subjectList: class10, classNumber: 'Class 10'),
  Class(subjectList: class9, classNumber: 'Class 9'),
  Class(subjectList: class8, classNumber: 'Class 8'),
  Class(subjectList: class7, classNumber: 'Class 7'),
  Class(subjectList: class6, classNumber: 'Class 6'),
  Class(subjectList: jeeNeet, classNumber: 'JEE NEET'),
  Class(subjectList: bscElectronics, classNumber: 'Bsc Electronics'),

  //Class(subjectList: mscElectronics, classNumber: 'M.Sc. Electronics')
];
