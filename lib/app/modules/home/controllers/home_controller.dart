import 'dart:async';
import 'dart:io';

import 'package:books_wallah/app/core/services/new_version.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_as_default_adv/open_as_default_adv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'package:wakelock/wakelock.dart';

import '../../../routes/app_pages.dart';
import '../../coins/controllers/coins_controller.dart';
import '../../coins/views/coins_view.dart';

class HomeController extends GetxController {
  // final isBottomBannerAdLoaded = false.obs;
  final changeTheme = Get.isDarkMode.obs;
  //late BannerAd bottomBannerAd;
  final selectedBottom =
      (Hive.box('settings').get('selectedBottom', defaultValue: 0) as int).obs;
  String pathDir = '';
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

  void onBottomBarSelected(int value) {
    selectedBottom.value = value;
    Hive.box('settings').put('selectedBottom', value);
  }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.bottomBanner,
  //     size: AdSize.banner,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isBottomBannerAdLoaded.value = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   if (isBottomBannerAdLoaded.isFalse) {
  //     bottomBannerAd.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  @override
  void onInit() {
    // if (kReleaseMode) {
    //   _createBottomBannerAd();
    // }
    receiveSharing();
    OpenAsDefault.getFileIntent.then((value) {
      if (value != null) {
        try {
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
    ever(changeTheme,
        (_) => Hive.box('settings').put('darkmode', changeTheme.value));
    Wakelock.toggle(enable: true);
    super.onInit();
  }

  @override
  void onReady() async {
    pathDir = await filesDocDir();
    try {
      final newVersion = NewVersionPlus(androidId: "com.sks.books_wallah");
      if (Get.context != null) {
        newVersion.getVersionStatus().then((status) {
          if (status != null && (status.localVersion != status.storeVersion)) {
            newVersion.showUpdateDialog(
              context: Get.context!,
              versionStatus: status,
              dialogTitle: 'Update Available',
              dialogText:
                  "What's New!\n${status.releaseNotes}\nYou can now update this app from ${status.localVersion} to ${status.storeVersion}",
            );
          }
        }).catchError((e) {
          //do Nothing
        });
      }
    } catch (e) {
      //do Nothing
    }

    super.onReady();
  }

  @override
  void onClose() {
    _intentDataStreamSubscription?.cancel();
    super.onClose();
  }
}
