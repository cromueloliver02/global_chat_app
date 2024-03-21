import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/core/models/models.dart';
import 'package:global_chat/core/res/app_images.dart';
import 'package:global_chat/core/utils/error_utils.dart';
import 'package:global_chat/core/utils/helpers.dart';
import 'package:global_chat/home/view/home_page.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/profile/bloc/profile_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = 'splash';
  static const String routePath = '/$routeName';

  void _profileListener(BuildContext ctx, ProfileState state) {
    if (state.loadStatus.isSuccess) ctx.goNamed(HomePage.routeName);

    if (state.loadStatus.isFailure) {
      final ErrorDetails error = ErrorUtils.generateError(state.failure!);
      showErrorDialog(
        ctx,
        title: error.title,
        message: error.message,
        failure: error.failure,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>.value(
      value: sl<ProfileBloc>(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: _profileListener,
        child: const SplashView(),
      ),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(142),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.splash),
            const Padding(
              padding: EdgeInsets.only(top: 300),
              child: SpinKitFadingCircle(
                color: Colors.deepPurple,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileLoaded());
  }
}
