import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/profile/bloc/profile_bloc.dart';
import 'package:global_chat/profile/widgets/profile_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = 'profile';
  static const String routePath = routeName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>.value(
      value: sl<ProfileBloc>(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProfileAppBar(),
      ),
      body: Center(
        child: Text('PROFILE PAGE'),
      ),
    );
  }
}
