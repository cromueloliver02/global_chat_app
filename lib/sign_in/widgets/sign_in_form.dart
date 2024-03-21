import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:iconly/iconly.dart';

import 'package:global_chat/core/formz_inputs/formz_inputs.dart';
import 'package:global_chat/core/widgets/widgets.dart';
import 'package:global_chat/sign_in/bloc/sign_in_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.autovalidateMode != curr.autovalidateMode,
      builder: (ctx, state) => Column(
        children: [
          GCATextField(
            enabled: !state.status.isInProgressOrSuccess,
            autovalidateMode: state.autovalidateMode,
            hintText: 'Email address',
            keyboardType: TextInputType.emailAddress,
            validator: (v) => state.emailInput.validator(v)?.text(),
            onChanged: (v) => ctx.read<SignInBloc>().add(SignInEmailChanged(v)),
          ),
          const SizedBox(height: 10),
          GCATextField(
            enabled: !state.status.isInProgressOrSuccess,
            autovalidateMode: state.autovalidateMode,
            obscureText: _obscureText,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? IconlyLight.hide : IconlyLight.show,
                color: Colors.grey,
              ),
              onPressed: () => setState(() => _obscureText = !_obscureText),
            ),
            validator: (v) => state.passwordInput.validator(v)?.text(),
            onChanged: (v) =>
                ctx.read<SignInBloc>().add(SignInPasswordChanged(v)),
          ),
          const SizedBox(height: 10),
          GCARoundedButton(
            enabled: !state.status.isInProgressOrSuccess,
            mainAxisSize: MainAxisSize.max,
            label: 'Sign In',
            onPressed: () =>
                ctx.read<SignInBloc>().add(const SignInSubmitted()),
          ),
        ],
      ),
    );
  }
}
