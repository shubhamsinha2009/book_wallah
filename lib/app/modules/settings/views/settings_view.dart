import 'package:app_settings/app_settings.dart';
import 'package:books_wallah/app/core/services/new_version.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // DrawerHeader(child: Image.asset("assets/drawer.png")),
        ListTile(
          title: const Text(
            'Whatsapp Click to Chat',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: const Icon(
            Icons.whatsapp_outlined,
          ),
          onTap: () => Get.toNamed(Routes.whatsappChat),
        ),
        // ListTile(
        //   title: const Text(
        //     'Downloaded',
        //     style: TextStyle(
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   leading: const Icon(
        //     Icons.file_download_rounded,
        //   ),
        //   onTap: () => Get.toNamed(Routes.downloaded),
        // ),
        ListTile(
            title: const Text(
              'Rate Us',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(
              Icons.rate_review_outlined,
            ),
            onTap: () async {
              try {
                await launchUrlString(
                    "https://play.google.com/store/apps/details?id=com.sks.books_wallah",
                    mode: LaunchMode.externalNonBrowserApplication);
              } on PlatformException {
                Get.showSnackbar(GetSnackBar(
                  backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                  messageText: const Text('Unable to open App'),
                  icon: const Icon(Icons.error_outline),
                  snackPosition: SnackPosition.TOP,
                  duration: const Duration(seconds: 3),
                ));
              }
            }),
        ListTile(
          title: const Text(
            'Share Books Wallah',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: const Icon(
            Icons.share_outlined,
          ),
          onTap: () => Share.share(
              " Check Out Books Wallah here for many more exciting features for you ----  https://play.google.com/store/apps/details?id=com.sks.books_wallah"),
        ),

        // Obx(
        //   () => controller.isSettingsBannerAdLoaded.isTrue
        //       ? SizedBox(
        //           height: controller.settingsBannerAd.size.height.toDouble(),
        //           width: controller.settingsBannerAd.size.width.toDouble(),
        //           child: controller.adWidget(ad: controller.settingsBannerAd),
        //         )
        //       : const SizedBox(
        //           height: 0,
        //           width: 0,
        //         ),
        // ),
        ListTile(
          onTap: () {
            try {
              final newVersion = NewVersionPlus(
                androidId: "com.sks.books_wallah",
              );

              newVersion.getVersionStatus().then((status) {
                if (status != null &&
                    (status.localVersion != status.storeVersion)) {
                  newVersion.showUpdateDialog(
                    context: context,
                    versionStatus: status,
                    dialogTitle: 'Update Available',
                    dialogText:
                        "What's New!\n${status.releaseNotes}\nYou can now update this app from ${status.localVersion} to ${status.storeVersion}",
                  );
                } else {
                  Get.showSnackbar(GetSnackBar(
                    backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                    messageText:
                        Text("You have latest version ${status?.localVersion}"),
                    icon: const Icon(Icons.error_outline),
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 3),
                  ));
                }
              }).catchError((e) {
                //do Nothing
              });
            } catch (e) {
              //doNothing
            }
          },
          leading: const Icon(Icons.system_update_outlined),
          title: const Text(
            'Check For Update',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //TODO: FeedBack
        ListTile(
          onTap: () async {
            try {
              await launchUrlString(
                "https://docs.google.com/forms/d/e/1FAIpQLSfCuPkBlubDdINE16dYNHs9gNaZr44ncStDOrygnEWgSDwFpQ/viewform?usp=sf_link",
                mode: LaunchMode.externalApplication,
              );
            } on PlatformException {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                messageText: const Text('Unable to open '),
                icon: const Icon(Icons.error_outline),
                snackPosition: SnackPosition.TOP,
                duration: const Duration(seconds: 3),
              ));
            }
          },
          leading: const Icon(Icons.feedback),
          title: const Text(
            'Feedback - Tell Books You Need',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //TODO: Privacy Policy
        ListTile(
          onTap: () async {
            try {
              await launchUrlString(
                "https://sites.google.com/view/privacy-policy-books-wallah/home",
                mode: LaunchMode.inAppWebView,
              );
            } on PlatformException {
              Get.showSnackbar(const GetSnackBar(
                messageText: Text('Unable to open '),
                icon: Icon(Icons.error_outline),
                snackPosition: SnackPosition.TOP,
                duration: Duration(seconds: 3),
              ));
            }
          },
          leading: const Icon(Icons.privacy_tip),
          title: const Text(
            'Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListTile(
          onTap: () async {
            try {
              await launchUrlString(
                "https://sites.google.com/view/books-wallah-dmcapolicy/home",
                mode: LaunchMode.inAppWebView,
              );
            } on PlatformException {
              Get.showSnackbar(const GetSnackBar(
                messageText: Text('Unable to open '),
                icon: Icon(Icons.error_outline),
                snackPosition: SnackPosition.TOP,
                duration: Duration(seconds: 3),
              ));
            }
          },
          leading: const Icon(Icons.policy),
          title: const Text(
            'DMCA Policy',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        ListTile(
          onTap: () => AppSettings.openAppSettings(),
          leading: const Icon(
            Icons.app_settings_alt,
          ),
          title: const Text(
            'App Settings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListTile(
          onTap: () async {
            try {
              await launchUrlString(
                "https://t.me/+liqZuWFmTPoxY2M1",
                mode: LaunchMode.externalApplication,
              );
            } on PlatformException {
              Get.showSnackbar(const GetSnackBar(
                messageText: Text('Unable to open '),
                icon: Icon(Icons.error_outline),
                snackPosition: SnackPosition.TOP,
                duration: Duration(seconds: 3),
              ));
            }
          },
          leading: const Icon(
            Icons.telegram_outlined,
          ),
          title: const Text(
            'Our Telegram Channel',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
