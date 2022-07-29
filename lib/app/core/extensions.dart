import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'dart:io';

extension StringExtensions on String {
  String get sort => toLowerCase().removeAllWhitespace;

  // String get nameOfFile => split('/').last;
}

extension LinksExension on String {
  String get ncert => 'https://ncert.nic.in/textbook/pdf/$this.pdf';
  String get gdrive => 'https://drive.google.com/uc?export=download&id=$this';
}

extension FileExtention on FileSystemEntity {
  String get name {
    return path.split("/").last;
  }
}
