import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:global_chat/sign_up/bloc/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String routeName = 'signup';
  static const String routePath = routeName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (ctx) => SignUpBloc(authRepository: ctx.read<AuthRepository>()),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SIGN UP PAGE'),
      ),
    );
  }
}
