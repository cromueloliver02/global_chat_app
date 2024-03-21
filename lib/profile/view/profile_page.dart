import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:profile_service/profile_service.dart';

import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/profile/bloc/profile_bloc.dart';
import 'package:global_chat/profile/widgets/profile_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = 'profile';
  static const String routePath = routeName;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ProfileRepository>(
      create: (ctx) => ProfileRepositoryImpl(
        profileService: sl<ProfileService>(),
      ),
      child: BlocProvider(
        create: (ctx) => ProfileBloc(
          profileRepository: ctx.read<ProfileRepository>(),
        ),
        child: const ProfileView(),
      ),
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
