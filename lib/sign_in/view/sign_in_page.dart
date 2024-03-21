import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/core/models/models.dart';
import 'package:global_chat/core/res/app_images.dart';
import 'package:global_chat/core/utils/error_utils.dart';
import 'package:global_chat/core/utils/helpers.dart';
import 'package:global_chat/core/widgets/widgets.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/sign_in/bloc/sign_in_bloc.dart';
import 'package:global_chat/sign_in/widgets/sign_in_form.dart';
import 'package:global_chat/sign_up/view/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const String routeName = 'signin';
  static const String routePath = '/$routeName';

  void _signInFailureListener(BuildContext ctx, SignInState state) {
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
    return BlocProvider<SignInBloc>(
      create: (ctx) => SignInBloc(authRepository: sl<AuthRepository>()),
      child: BlocListener<SignInBloc, SignInState>(
        listenWhen: (prev, curr) =>
            prev.status != curr.status && curr.status.isFailure,
        listener: _signInFailureListener,
        child: const SignInView(),
      ),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 550),
                  child: SizedBox(
                    width: 100,
                    child: Image.asset(AppImages.splash),
                  ),
                ),
                ListView(
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
                            'Sign in to your account',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: BlocBuilder<SignInBloc, SignInState>(
                            buildWhen: (prev, curr) =>
                                prev.status != curr.status,
                            builder: (ctx, state) => GCATextButton(
                              label: 'Sign up instead?',
                              onPressed: !state.status.isInProgressOrSuccess
                                  ? () => context.goNamed(SignUpPage.routeName)
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SignInForm(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
