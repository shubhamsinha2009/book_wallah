import '../../model/subjects.dart';
import 'subjects/ap.dart';
import 'subjects/de.dart';
import 'subjects/mffe.dart';
import 'subjects/naas.dart';
import 'subjects/sc.dart';
import 'subjects/sd.dart';

List<Subject> bscElectronics = [
  Subject(
    subject: 'Network Analysis and Synthesis',
    booksList: naas,
  ),
  Subject(
    subject: 'Mathematics Foundation for Electronics',
    booksList: mffe,
  ),
  Subject(
    subject: 'Semiconductor Devices',
    booksList: sd,
  ),
  Subject(
    subject: 'Applied Physics',
    booksList: ap,
  ),
  Subject(
    subject: 'Electronics Circuits',
    booksList: sc,
  ),
  Subject(
    subject: 'Digital Electronics and Verilog/VHDL',
    booksList: de,
  ),
];
