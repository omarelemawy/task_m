import 'package:get/get.dart';

import '../errors/failures.dart';
import '../languages/app_translations.dart';

class Utils {
  Utils._();

  //   method to get Images by specific size
  // static Future<Uint8List> getBytesFromAsset(String path,
  //     {required int width, required int height}) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width, targetHeight: height);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }

  /// ERROR NOTIFICATION
  static showError(String message) {
    // if (Get.isSnackbarOpen) {
    //   Get.closeAllSnackbars();
    // }
    // Get.rawSnackbar(
    //   message: message,
    //   barBlur: 5,
    //   maxWidth: Get.width - 32,
    //   borderRadius: 10,
    //   snackPosition: SnackPosition.TOP,
    //   backgroundColor: Colors.red.withOpacity(0.7),
    //   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    // );
  }

  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case AuthFailure:
        return failure.message!;
      case ValidationFailure:
        return failure.message!;
      case ServerFailure:
        return LocaleKeys.serverFailure.tr;
      case NetworkFailure:
        return LocaleKeys.networkFailure.tr;
      case UnVerifiedFailure:
        return LocaleKeys.unVerifiedFailure.tr;
      case ExpiredPlanFailure:
        return failure.message!;

      case UnAuthenticatedFailure:
        // Get.offAllNamed(Routes.login);
        return failure.message!;
      default:
        return LocaleKeys.unExpectedError.tr;
    }
  }
}
