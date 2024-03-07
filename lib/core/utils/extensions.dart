import 'package:get/get.dart';

import '../languages/app_translations.dart';

extension IntExtensions on int {
  String get getDurationReminder {
    if (toString().length == 1) {
      return '0$this';
    } else {
      return '$this';
    }
  }
}

extension StringExtensions on String {
  String get toPrice {
    return '$this ${LocaleKeys.currency.tr}';
  }
}
