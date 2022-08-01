import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'dart:io';

extension StringExtensions on String {
  String get sort => toLowerCase().removeAllWhitespace;

  // String get nameOfFile => split('/').last;
}

extension LinksExension on String {
  String get ncert => 'https://ncert.nic.in/textbook/pdf/$this.pdf';
  String get gdrive => 'https://drive.google.com/uc?export=download&id=$this';
  String get pdfdrive =>
      "https://www.pdfdrive.com/download.pdf?id=$this&u=cache&ext=pdf";

  String get uploadgram => "https://dl.uploadgram.me/$this?raw";
}

extension FileExtention on FileSystemEntity {
  String get name {
    return path.split("/").last;
  }
}
