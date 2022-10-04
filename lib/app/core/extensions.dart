import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'dart:io';

extension StringExtensions on String {
  String get sort => toLowerCase().removeAllWhitespace;
  String get nameOfFile => split('/').last;

  String get removeExtensionPdf => replaceAll('.pdf', '');
}

extension LinksExension on String {
  String get ncert => 'https://ncert.nic.in/textbook/pdf/$this.pdf';
  String get gdrive => 'https://drive.google.com/uc?export=download&id=$this';
  String get pdfdrive =>
      "https://www.pdfdrive.com/download.pdf?id=$this&u=cache&ext=pdf";
  String get ncertexemplar =>
      'https://ncert.nic.in/pdf/publication/exemplarproblem/$this.pdf';
  String get uploadgram => "https://dl.uploadgram.me/$this?raw";
}

extension FileExtention on FileSystemEntity {
  String get name {
    return path.split("/").last;
  }
}

extension NcertExemplar on String {
  String get class12mathsexemplar =>
      'classXII/mathematics/leep2$this'.ncertexemplar;
  String get class12physicsexemplar =>
      'classXII/physics/leep1$this'.ncertexemplar;
  String get class12biologyexemplar =>
      'classXII/biology/leep4$this'.ncertexemplar;
  String get class12chemistryexemplar =>
      'classXII/chemistry/leep5$this'.ncertexemplar;
  String get class11mathsexemplar =>
      'classXI/mathematics/keep2$this'.ncertexemplar;
  String get class11physicsexemplar =>
      'classXI/physics/keep3$this'.ncertexemplar;
  String get class11biologyexemplar =>
      'classXI/biology/keep4$this'.ncertexemplar;
  String get class11chemistryexemplar =>
      'classXI/chemistry/keep5$this'.ncertexemplar;
  String get class10mathsexemplar =>
      'classX/mathematics/jeep2$this'.ncertexemplar;
  String get class10scienceexemplar =>
      'classX/science/jeep1$this'.ncertexemplar;
  String get class9mathsexemplar =>
      'classIX/mathematics/ieep2$this'.ncertexemplar;
  String get class9scienceexemplar =>
      'classIX/science/ieep1$this'.ncertexemplar;
  String get class8mathsexemplar =>
      'classVIII/mathematics/heep2$this'.ncertexemplar;
  String get class8scienceexemplar =>
      'classVIII/science/heep1$this'.ncertexemplar;
  String get class7mathsexemplar =>
      'classVII/Mathematics/gemp1$this'.ncertexemplar;
  String get class7scienceexemplar =>
      'classVII/Science/geep1$this'.ncertexemplar;
  String get class6scienceexemplar =>
      'classVI/science/feep2$this'.ncertexemplar;
  String get class6mathsexemplar =>
      'classVI/Mathematics/feep1$this'.ncertexemplar;
}
