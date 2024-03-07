// 🐦 Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lunment_ventures/core/languages/app_translations.dart';

enum ValidationType {
  phone,
  name,
  cardNumber,
  notEmpty,
  email,
  password,
  validationCode
}

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context,
  ) {
    if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
        return LocaleKeys.enterValidEmail.tr;
      }
      return null;
    } else if (fieldType == ValidationType.password) {
      if (value!.length < 6) {
        return LocaleKeys.enterValidPassword.tr;
      }
      return null;
    }
    return null;
  }
}
