import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/core/models/models.dart';
import 'package:global_chat/core/utils/error_utils.dart';
import 'package:global_chat/core/utils/helpers.dart';
import 'package:global_chat/core/widgets/widgets.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/sign_in/view/sign_in_page.dart';
import 'package:global_chat/sign_up/bloc/sign_up_bloc.dart';
import 'package:global_chat/sign_up/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String routeName = 'signup';
  static const String routePath = routeName;

  void _signUpFailureListener(BuildContext ctx, SignUpState state) {
    final ErrorDetails error = ErrorUtils.generateError(state.failure!);
    showErrorDialog(
      ctx,
      title: error.title,
      message: error.message,
      failure: error.failure,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (ctx) => SignUpBloc(authRepository: sl<AuthRepository>()),
      child: BlocListener<SignUpBloc, SignUpState>(
        listenWhen: (prev, curr) =>
            prev.status != curr.status && curr.status.isFailure,
        listener: _signUpFailureListener,
        child: const SignUpView(),
      ),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GCAKeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints.expand(),
          child: Center(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Text(
                  'Chat with anyone around the world.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign up for an account',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        buildWhen: (prev, curr) => prev.status != curr.status,
                        builder: (ctx, state) => GCATextButton(
                          label: 'Already have an account?',
                          onPressed: !state.status.isInProgressOrSuccess
                              ? () => context.goNamed(SignInPage.routeName)
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
