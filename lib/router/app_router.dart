import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/sign_in/view/sign_in_page.dart';
import 'package:global_chat/splash/view/splash_page.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashPage.routePath,
    // debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: SplashPage.routeName,
        path: SplashPage.routePath,
        pageBuilder: (ctx, state) => _pageBuilder(
          pageKey: state.pageKey,
          page: const SplashPage(),
        ),
      ),
      GoRoute(
        name: SignInPage.routeName,
        path: SignInPage.routePath,
        pageBuilder: (ctx, state) => _pageBuilder(
          pageKey: state.pageKey,
          page: const SignInPage(),
        ),
      ),
    ],
  );

  static Page<dynamic> _pageBuilder({
    required ValueKey<String> pageKey,
    required Widget page,
    List<BlocProvider>? providers,
  }) {
    return CustomTransitionPage(
      key: pageKey,
      transitionsBuilder: (_, anim, __, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      child: providers != null
          ? MultiBlocProvider(
              providers: providers,
              child: page,
            )
          : page,
    );
  }
}
