import 'dart:io';

import 'package:books_wallah/app/core/extensions.dart';
import 'package:books_wallah/app/modules/pdfs/controllers/pdfs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtmSheet extends StatelessWidget {
  const BtmSheet({
    Key? key,
    required this.controller,
    required this.file,
  }) : super(key: key);

  final PdfsController controller;
  final FileSystemEntity file;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode ? Colors.black : Colors.white,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          const Text("Rename"),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value != null) {
                if (!controller.validateRename()) {
                  return "File Name is not valid";
                } else {
                  return null;
                }
              }
              return null;
            },
            initialValue: file.name.removeExtensionPdf,
            keyboardType: TextInputType.name,
            onChanged: (value) => controller.rename.value = '$value.pdf',
            maxLines: 1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Get.back(), child: const Text('Back')),
              TextButton(
                  onPressed: () {
                    if (controller.validateRename()) {
                      controller
                          .changeFileNameOnlySync(file.path)
                          .then((value) {
                        controller.isLoading.value = true;
                        controller.onInitialisation();
                      }).whenComplete(() => Get.back());
                    }
                  },
                  child: const Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
