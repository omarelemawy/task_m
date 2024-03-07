import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lunment_ventures/core/routes/route_strings.dart';
import 'package:lunment_ventures/features/post/presentation/post_details/views/post_details_view.dart';
import 'package:lunment_ventures/features/post/presentation/splash/views/splash_view.dart';

import '../../features/post/presentation/home/views/home_view.dart';
import '../consts/k_strings.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: RouteStrings.splashPage,
        path: RouteStrings.splashPage,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        name: RouteStrings.homePage,
        path: RouteStrings.homePage,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        name: RouteStrings.postDetails,
        path: RouteStrings.postDetails,
        builder: (BuildContext context, GoRouterState state) {
          final Map<String, dynamic> query = state.queryParams;

          return PostDetailsView(
              id: query[Kstrings.postId] == null
                  ? null
                  : int.tryParse(query[Kstrings.postId]));
        },
      ),
    ],
  );
}
