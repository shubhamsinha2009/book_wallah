import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../controllers/coins_controller.dart';

class CoinsView extends GetView<CoinsController> {
  const CoinsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).copyWith().size.height * 0.80,
        width: MediaQuery.of(context).copyWith().size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Books Wallah Coins',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${controller.coins}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Number of Books Wallah Coins\n = \nNumber of pdfs you can read',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Not have enough coins to read pdfs?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                SimpleConnectionChecker.isConnectedToInternet()
                    .then((isConnected) {
                  if (isConnected) {
                    controller.showRewardedAd();
                  } else {
                    Get.showSnackbar(GetSnackBar(
                      backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                      title: "No Internet",
                      message: 'Please Check Your Internet',
                      duration: const Duration(seconds: 5),
                    ));
                  }
                  Navigator.pop(context, false);
                });
              },
              child: const Text(
                "Watch Rewarded Ads to get more coins",
              ),
            ),
          ],
        ));
  }
}
