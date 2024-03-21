import 'package:flutter/material.dart';

import 'package:global_chat/core/res/app_images.dart';
import 'package:global_chat/home/view/home_page.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = 'splash';
  static const String routePath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> _goToHome() async {
    final GoRouter router = GoRouter.of(context);
    await Future.delayed(const Duration(seconds: 2));
    router.goNamed(HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(142),
          child: Image.asset(AppImages.splash),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _goToHome();
  }
}
