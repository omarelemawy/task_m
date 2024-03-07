import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({
    required this.onChange,
    required this.hintText,
    required this.items,
    this.dropdownValue,
    super.key,
  });

  String? hintText;
  final dropdownValue;
  Function(dynamic) onChange;
  List<DropdownMenuItem<dynamic>>? items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField(
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 25,
        ),
        hint: CustomText(
          hintText,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: const Color(0xffAEAEAE), fontSize: 16),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xff626262)),
              borderRadius: BorderRadius.circular(10.0)),
        ),
        onChanged: onChange,
        items: items,
      ),
    );
  }
}
