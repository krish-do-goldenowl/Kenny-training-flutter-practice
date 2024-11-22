import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:myapp/src/features/login/view/login_view.dart';
import 'package:myapp/src/features/register/view/register_view.dart';
import 'package:myapp/src/features/splashScreen/view/splash_screen_view.dart';

import '../features/common/view/not_found_view.dart';

import 'coordinator.dart';
import 'route_name.dart';

class AppRouter {
  late final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.splashScreen.path,
    debugLogDiagnostics: kDebugMode,
    observers: [BotToastNavigatorObserver()],
    routes: <RouteBase>[
      GoRoute(
          parentNavigatorKey: AppCoordinator.navigatorKey,
          path: AppRouteNames.splashScreen.path,
          name: AppRouteNames.splashScreen.name,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreenView()),
      GoRoute(
          parentNavigatorKey: AppCoordinator.navigatorKey,
          path: AppRouteNames.register.path,
          name: AppRouteNames.register.name,
          builder: (BuildContext context, GoRouterState state) =>
              RegisterView()),
      GoRoute(
          parentNavigatorKey: AppCoordinator.navigatorKey,
          path: AppRouteNames.login.path,
          name: AppRouteNames.login.name,
          builder: (BuildContext context, GoRouterState state) => LoginView()),
    ],
    errorBuilder: (_, __) => const NotFoundView(),
  );
}
