import 'dart:io';
import 'dart:math';
import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../coins/controllers/coins_controller.dart';
import '../../coins/views/coins_view.dart';
import '../../home/controllers/home_controller.dart';

class DownloadController extends GetxController {
  final chapter = Get.arguments[0] as Chapter;
  final bookPath = Get.arguments[1] as String;
  final total = 1.obs;
  final received = 0.obs;
  late StreamedResponse response;
  final List<int> _bytes = [];
  final isLoading = true.obs;
  final homeController = Get.find<HomeController>();
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;
  // InterstitialAd? interstitialAd;
  // final int maxFailedLoadAttempts = 3;
  // int interstitialLoadAttempts = 0;
  // final adDismissed = false.obs;
  final getDetails = false.obs;
  late String currentLink;

  Future<void> getdetails(String url) async {
    try {
      response = await Client().send(Request('GET', Uri.parse(url)));
      total.value = response.contentLength ?? 0;
      received.value = 0;
      getDetails.value = false;
      if (response.statusCode == 400) {
        getDetails.value = true;
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
          title: 'Try Different Source Link',
          message: 'Source Link Now Working at this time',
          duration: const Duration(seconds: 5),
        ));
      }
    } on SocketException catch (_) {
      getDetails.value = true;
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        title: 'No Internet Connected',
        message: 'Please Check Internet Connection',
        duration: const Duration(seconds: 5),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        title: 'Error',
        message: e.toString(),
        duration: const Duration(seconds: 5),
      ));
    } finally {
      isLoading.value = false;
    }
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<void> downloadFile(String filePath) async {
    final file = File(filePath);
    try {
      if (response.statusCode == 400) {
        getDetails.value = true;
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
          title: 'Try Different Source Link',
          message: 'Source Link Now Working at this time',
          duration: const Duration(seconds: 5),
        ));
      } else {
        if (Get.find<CoinsController>().coins.value > 0) {
          Get.find<CoinsController>().coins.value =
              Get.find<CoinsController>().coins.value - 3;
          Hive.box('user')
              .put('coins', Get.find<CoinsController>().coins.value);
          response.stream.listen((value) {
            _bytes.addAll(value);
            received.value += value.length;
          }).onDone(() async {
            if (total.value == received.value) {
              await file.writeAsBytes(_bytes);
            } else {
              getDetails.value = true;
              received.value = 0;
              Get.showSnackbar(GetSnackBar(
                backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                title: 'Download Cancelled',
                message: 'Please Check Your Internet Connection',
                duration: const Duration(seconds: 5),
              ));
            }
          });
        } else {
          showModalBottomSheet(
            isDismissible: true,
            context: Get.context!,
            builder: (context) {
              return const CoinsView();
            },
          );
        }
      }
    } on SocketException catch (_) {
      getDetails.value = true;
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        title: 'No Internet Connected',
        message: 'Please Check Internet Connection',
        duration: const Duration(seconds: 5),
      ));
    } catch (e) {
      getDetails.value = true;
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        title: 'Error',
        message: e.toString(),
        duration: const Duration(seconds: 5),
      ));
    }
  }

  Future<String> filesDocDir() async {
    //Get this App Document Directory
    //App Document Directory + folder name

    final Directory? appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder = Directory('${appDocDir?.path}/Downloads');

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

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.downoadBodyBanner,
  //     size: AdSize.mediumRectangle,
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

  // Future<void> createInterstitialAd() async {
  //   try {
  //     await InterstitialAd.load(
  //       adUnitId: AdHelper.viewBookPdf,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           interstitialAd = ad;
  //           interstitialLoadAttempts = 0;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           interstitialLoadAttempts += 1;
  //           interstitialAd = null;
  //           if (interstitialLoadAttempts <= maxFailedLoadAttempts) {
  //             createInterstitialAd();
  //           }
  //         },
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     getDetails.value = true;
  //     Get.showSnackbar(GetSnackBar(
  //       backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
  //       title: 'Error',
  //       message: e.toString(),
  //       duration: const Duration(seconds: 5),
  //     ));
  //   }
  // }

  // Future<void> showInterstitialAd() async {
  //   try {
  //     if (interstitialAd != null) {
  //       interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //             ad.dispose();
  //             adDismissed.value = true;
  //             createInterstitialAd();
  //           },
  //           onAdFailedToShowFullScreenContent:
  //               (InterstitialAd ad, AdError error) {
  //             ad.dispose();
  //             createInterstitialAd();
  //           },
  //           onAdShowedFullScreenContent: (InterstitialAd ad) {});
  //       if (interstitialAd != null) {
  //         interstitialAd!.show();
  //       }
  //     }
  //   } on Exception catch (e) {
  //     Get.showSnackbar(GetSnackBar(
  //       backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
  //       title: 'Error',
  //       message: e.toString(),
  //       duration: const Duration(seconds: 5),
  //     ));
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  @override
  void onInit() {
    currentLink = chapter.links[0].link;
    getdetails(currentLink);
    // if (kReleaseMode) {
    // createInterstitialAd();
    //   _createBottomBannerAd();
    // }
    super.onInit();
  }

  @override
  void onClose() {
    // if (kReleaseMode) {
    //   bottomBannerAd.dispose();
    // interstitialAd?.dispose();
    // }
  }
}
