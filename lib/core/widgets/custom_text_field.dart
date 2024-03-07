import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lunment_ventures/core/theme/app_colors.dart';

import '../consts/validator.dart';
import '../theme/font_manager.dart';
import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.prefixIcon,
      this.hintText,
      this.labelText,
      this.maxLength,
      this.prefixText,
      this.validator,
      this.suffixIcon,
      this.isMultiLine = false,
      this.expands = false,
      this.isObscure = false,
      this.textEditingController,
      this.hintStyle,
      this.prefixIconConstraints,
      this.isNumberOnly = false,
      this.onTap,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.readOnly = false,
      this.isBorder = false,
      this.enabled = true,
      this.isWithTitle = true,
      this.keyboardType,
      this.labelStyle = const TextStyle(
          color: Color(0xff10162E),
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: FontConstants.fontFamily),
      this.borderRadius = 10,
      this.borderColor = const Color(0xffE2E2E2),
      this.height})
      : super(key: key);
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final double? borderRadius;
  final String? prefixText;
  final String? Function(String?)? validator;
  final bool isMultiLine;
  final Widget? suffixIcon;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final BoxConstraints? prefixIconConstraints;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final bool isNumberOnly;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final bool? enabled;
  final bool expands;
  final bool isObscure;
  final bool isBorder;
  final bool isWithTitle;
  final double? height;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isWithTitle)
          CustomText(
            labelText!,
            style: labelStyle,
          ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height,
          child: TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onFieldSubmitted: onFieldSubmitted,
            onEditingComplete: onEditingComplete,
            maxLines: isMultiLine ? null : 1,
            minLines: isMultiLine ? 5 : null,
            validator: validator,
            controller: textEditingController,
            enabled: enabled,
            maxLength: maxLength,
            expands: expands,
            readOnly: readOnly!,
            obscureText: isObscure,
            onChanged: onChanged,
            onTap: onTap,
            keyboardType: isNumberOnly
                ? const TextInputType.numberWithOptions(decimal: true)
                : keyboardType,
            inputFormatters: [if (isNumberOnly) AppValidator.priceValueOnly()],
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorStyle: context.textTheme.bodyMedium!.copyWith(
                  color: const Color(0xffF04438),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300),
              hintText: hintText,
              hintStyle: hintStyle ??
                  context.textTheme.headlineMedium!
                      .copyWith(color: Colors.grey, fontSize: 18),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: isMultiLine ? 20 : 15,
                  vertical: isMultiLine ? 5.0 : 0),
              prefixIcon: prefixIcon,
              filled: !isBorder,
              fillColor: Colors.grey.withOpacity(.2),
              prefixIconConstraints: prefixIconConstraints,
              prefixText: prefixText ?? "",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      isMultiLine ? 10.sp : borderRadius!)),
              enabledBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(width: 1, color: borderColor!)
                    : const BorderSide(
                        width: 0.0, color: AppColors.scaffoldColor),
                borderRadius:
                    BorderRadius.circular(isMultiLine ? 10.sp : borderRadius!),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(width: 1, color: borderColor!)
                    : const BorderSide(
                        width: 0.0, color: AppColors.scaffoldColor),
                borderRadius:
                    BorderRadius.circular(isMultiLine ? 10.sp : borderRadius!),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(width: 1, color: borderColor!)
                    : const BorderSide(
                        width: 0.0, color: AppColors.scaffoldColor),
                borderRadius:
                    BorderRadius.circular(isMultiLine ? 10.sp : borderRadius!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
