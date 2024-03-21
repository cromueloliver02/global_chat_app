import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:iconly/iconly.dart';

import 'package:global_chat/core/formz_inputs/formz_inputs.dart';
import 'package:global_chat/core/widgets/widgets.dart';
import 'package:global_chat/sign_up/bloc/sign_up_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.autovalidateMode != curr.autovalidateMode,
      builder: (ctx, state) => Column(
        children: [
          GCATextField(
            enabled: !state.status.isInProgressOrSuccess,
            autovalidateMode: state.autovalidateMode,
            hintText: 'Username',
            validator: (v) => state.usernameInput.validator(v)?.text(),
            onChanged: (v) =>
                ctx.read<SignUpBloc>().add(SignUpUsernameChanged(v)),
          ),
          const SizedBox(height: 10),
          GCATextField(
            enabled: !state.status.isInProgressOrSuccess,
            autovalidateMode: state.autovalidateMode,
            hintText: 'Email address',
            keyboardType: TextInputType.emailAddress,
            validator: (v) => state.emailInput.validator(v)?.text(),
            onChanged: (v) => ctx.read<SignUpBloc>().add(SignUpEmailChanged(v)),
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
                ctx.read<SignUpBloc>().add(SignUpPasswordChanged(v)),
          ),
          const SizedBox(height: 10),
          GCARoundedButton(
            enabled: !state.status.isInProgressOrSuccess,
            mainAxisSize: MainAxisSize.max,
            label: 'Sign Up',
            onPressed: () =>
                ctx.read<SignUpBloc>().add(const SignUpSubmitted()),
          ),
        ],
      ),
    );
  }
}
