import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lunment_ventures/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.name,
    required this.canPop,
  });

  final String name;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // height: 121.h,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: canPop
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            )
          : const SizedBox(),
      title: CustomText(
        name,
        style: context.textTheme.headlineLarge!.copyWith(
            color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

/*
 Container(
          height: 121.h,
          color: AppColors.mainApp,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: 121.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          3.horizontalSpace,
                          CustomText(
                            name,
                            style: context.textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ]),
                    10.verticalSpace
                  ],
                ),
              ),
              Positioned(
                right: -150.h,
                top: -200.h,
                child: Container(
                  height: 310.h,
                  width: 310.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffffffff).withOpacity(.1),
                          width: 30.h),
                      shape: BoxShape.circle),
                ),
              ),
              Stack(
                children: ["", "", "", "", "", "", "", ""]
                    .asMap()
                    .entries
                    .map((e) => Positioned(
                          right: -150.h,
                          top: -200.h,
                          child: Container(
                            height: (280 - (e.key.toDouble() * 10)).h,
                            width: (280 - (e.key.toDouble() * 10)).h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color(0xffffffff).withOpacity(.1),
                                    width: 1),
                                shape: BoxShape.circle),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        Divider(
          height: 8.h,
          thickness: 8.h,
          color: AppColors.mainApp.withOpacity(.2),
        ),
   */
