import 'package:lunment_ventures/features/post/presentation/home/provider/home_provider.dart';
import 'package:lunment_ventures/features/post/presentation/splash/provider/splash_provider.dart';
import 'package:lunment_ventures/injector.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/post/presentation/post_details/provider/post_details_provider.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    ..._independentServices,

    // ..._uiConsumableProviders,
  ];

  static final List<SingleChildWidget> _independentServices = [
    ChangeNotifierProvider(create: (_) => SplashProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider(locator())),
    ChangeNotifierProvider(
        create: (_) => PostDetailsProvider(locator(), locator(), locator())),
  ];

  // static final List<SingleChildWidget> _uiConsumableProviders = [];
}
