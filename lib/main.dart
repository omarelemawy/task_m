import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunment_ventures/core/theme/theme_manager.dart';
import 'package:provider/provider.dart';

import '/injector.dart' as di;
import 'core/consts/providers.dart';
import 'core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(325, 844),
        builder: (context, child) {
          return MultiProvider(
            providers: Providers.providers,
            child: Builder(builder: (context) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: Routes.router,
                title: "Task",
                theme: applicationTheme,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: const Locale('en'),
              );
            }),
          );
        });
  }
}
