import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lunment_ventures/core/theme/app_colors.dart';
import 'package:lunment_ventures/core/widgets/custom_text.dart';

class ExpandedWidget extends StatefulWidget {
  ExpandedWidget({
    super.key,
    required this.title,
    required this.details,
  });
  String title;
  Widget details;

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.mainApp.withOpacity(.1),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            isOpen = value;
            setState(() {});
            print(value);
          },
          trailing: Container(
              width: 28.w,
              height: 28.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                color: AppColors.mainApp,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isOpen ? Icons.remove : Icons.add,
                color: Colors.white,
              )),
          title: SizedBox(
            width: 90,
            child: Row(
              children: [
                CustomText(
                  widget.title,
                  style: context.textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      color: const Color(0xff4A4A4A),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20),
              child: widget.details,
            ),
          ],
        ),
      ),
    );
  }
}
