import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/home/view/home_page.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/profile/view/profile_page.dart';
import 'package:global_chat/router/go_router_refresh_stream.dart';
import 'package:global_chat/router/slide_page_transition.dart';
import 'package:global_chat/sign_in/view/sign_in_page.dart';
import 'package:global_chat/sign_up/view/sign_up_page.dart';
import 'package:global_chat/splash/view/splash_page.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashPage.routePath,
    // debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(sl<AuthBloc>().stream),
    redirect: (BuildContext ctx, GoRouterState state) {
      final bool isSignedIn = ctx.read<AuthBloc>().state.status.isAuthenticated;
      final bool isSigningIn =
          state.matchedLocation.contains(SignInPage.routePath);

      if (!isSignedIn) return isSigningIn ? null : SignInPage.routePath;

      if (isSigningIn) return SplashPage.routePath;

      return null;
    },
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
        routes: [
          GoRoute(
            name: SignUpPage.routeName,
            path: SignUpPage.routePath,
            pageBuilder: (ctx, state) => _pageBuilder(
              pageKey: state.pageKey,
              page: const SignUpPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        name: HomePage.routeName,
        path: HomePage.routePath,
        pageBuilder: (ctx, state) => _pageBuilder(
          pageKey: state.pageKey,
          page: const HomePage(),
        ),
        routes: [
          GoRoute(
            name: ProfilePage.routeName,
            path: ProfilePage.routePath,
            pageBuilder: (ctx, state) => _pageBuilder(
              pageKey: state.pageKey,
              page: const ProfilePage(),
            ),
          ),
        ],
      ),
    ],
  );

  static Page<dynamic> _pageBuilder({
    required ValueKey<String> pageKey,
    required Widget page,
    List<BlocProvider>? providers,
  }) {
    return SlidePageTransition(
      key: pageKey,
      child: providers != null
          ? MultiBlocProvider(
              providers: providers,
              child: page,
            )
          : page,
    );
  }
}
