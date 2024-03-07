// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    required this.widget,
    required this.isLoading,
    required this.loadingWidget,
  });

  final Widget widget;
  final Widget loadingWidget;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
      children: [
        widget,
        if (isLoading)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black45,
              child: Center(
                child: loadingWidget,
              ),
            ),
          )
      ],
    ));
  }
}
