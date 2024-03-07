import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunment_ventures/core/theme/app_colors.dart';
import 'package:lunment_ventures/features/post/presentation/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () async => await context.read<SplashProvider>().navigate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainApp,
      body: Center(
          child: FlutterLogo(
        size: 100.r,
      )),
    );
  }
}
