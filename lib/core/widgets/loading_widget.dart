// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../consts/assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.description}) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.grey.withOpacity(.5),
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: LottieBuilder.asset(
              Assets.loadingSplash,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
