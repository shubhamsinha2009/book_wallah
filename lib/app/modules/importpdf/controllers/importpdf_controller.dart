import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:open_as_default_adv/open_as_default_adv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../../routes/app_pages.dart';
import '../../coins/controllers/coins_controller.dart';
import '../../coins/views/coins_view.dart';
import '../../home/controllers/home_controller.dart';

class ImportpdfController extends GetxController {
  String pathDir = '';
  final homeController = Get.find<HomeController>();
  StreamSubscription? _intentDataStreamSubscription;

  Future<void> pickFile() async {
    try {
      final String? result = await FlutterFileDialog.pickFile(
          params: const OpenFileDialogParams(
        copyFileToCacheDir: true,
        mimeTypesFilter: ['application/pdf'],
      ));

      await confirmDialog(result);
    } on PlatformException catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        messageText: Text(e.message ?? e.details),
        icon: const Icon(Icons.error_outline),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  Future<String> filesDocDir() async {
    //Get this App Document Directory
    //App Document Directory + folder name

    final Directory? appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder =
        Directory('${appDocDir?.path}/files/pdfs');

    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder =
          await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }

  Future<void> confirmDialog(String? result) async {
    if (result != null) {
      File(result).copy('$pathDir/${result.split("/").last}').then((value) {
        File(result).deleteSync();
        if (Get.find<CoinsController>().coins.value > 0) {
          Get.find<CoinsController>().coins.value--;
          Hive.box('user')
              .put('coins', Get.find<CoinsController>().coins.value);
          Get.toNamed(Routes.viewPdf, arguments: value.path);
        } else {
          showModalBottomSheet(
            isDismissible: true,
            context: Get.context!,
            builder: (context) {
              return const CoinsView();
            },
          );
        }
      });
    }
  }

  void receiveSharing() {
    // await analytics.logEvent(name: 'receive_sharing');
    _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
        .listen((List<SharedMediaFile> value) async {
      try {
        if (value.isNotEmpty) {
          //   print('Your file name ---------------------------------' +
          //     value.single.path);
          homeController.selectedBottom.value = 2;
          confirmDialog(value.single.path);
        }
      } on PlatformException catch (e) {
        Get.showSnackbar(GetSnackBar(
          messageText: Text(e.message ?? e.details),
          icon: const Icon(Icons.error_outline),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        ));
      }
    }, onError: (err) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        messageText: Text(err.message ?? err.details),
        icon: const Icon(Icons.error_outline),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      ));
    });

    // For sharing images coming from outside the app if the app is closed
    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
      if (value.isNotEmpty) {
        //  print('Your file name ---------------------------------' +
        //    value.single.path);
        try {
          confirmDialog(value.single.path);
        } on PlatformException catch (e) {
          Get.showSnackbar(GetSnackBar(
            backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
            messageText: Text(e.message ?? e.details),
            icon: const Icon(Icons.error_outline),
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3),
          ));
        }
      }
    });
  }

  @override
  void onInit() {
    receiveSharing();
    OpenAsDefault.getFileIntent.then((value) {
      if (value != null) {
        try {
          homeController.selectedBottom.value = 2;
          confirmDialog(value.path);
        } on PlatformException catch (e) {
          Get.showSnackbar(GetSnackBar(
            backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
            messageText: Text(e.message ?? e.details),
            icon: const Icon(Icons.error_outline),
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3),
          ));
        }
      }
    });

    super.onInit();
  }

  @override
  void onReady() async {
    pathDir = await filesDocDir();
    super.onReady();
  }

  @override
  void onClose() {
    _intentDataStreamSubscription?.cancel();
    super.onClose();
  }
}
