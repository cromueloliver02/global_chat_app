import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const String routeName = 'signin';
  static const String routePath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SIGN IN PAGE'),
      ),
    );
  }
}
