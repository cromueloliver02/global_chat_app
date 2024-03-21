import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:global_chat/sign_in/bloc/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const String routeName = 'signin';
  static const String routePath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (ctx) => SignInBloc(authRepository: ctx.read<AuthRepository>()),
      child: const SignInView(),
    );
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
