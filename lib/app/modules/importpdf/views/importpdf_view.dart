import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/importpdf_controller.dart';

class ImportpdfView extends GetView<ImportpdfController> {
  const ImportpdfView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: controller.pickFile,
      label: const Text('Import Pdf'),
      icon: const Icon(
        Icons.file_upload_sharp,
      ),
    );
  }
}
