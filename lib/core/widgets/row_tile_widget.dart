import 'package:flutter/material.dart';

import 'custom_text.dart';

class RowTileWidget extends StatelessWidget {
  const RowTileWidget({
    Key? key,
    required this.icon,
    this.textColor,
    this.iconColor,
    required this.text,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        CustomText(
          text,
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor),
        ),
      ],
    );
  }
}
