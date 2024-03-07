import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:lunment_ventures/core/consts/navigation_service.dart';

import '../../../../../core/routes/route_strings.dart';

class SplashProvider with ChangeNotifier {
  final context = NavigationService.context;

  navigate() async {
    context.goNamed(RouteStrings.homePage);
  }
}
