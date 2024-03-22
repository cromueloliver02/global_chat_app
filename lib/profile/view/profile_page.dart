import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

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
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProfileAppBar(),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (prev, curr) => prev.profile != curr.profile,
        builder: (ctx, state) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 150,
                child: Image.network(state.profile!.profileUrl),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(state.profile!.uid),
              subtitle: const Text('ID'),
            ),
            ListTile(
              leading: const Icon(IconlyBold.profile),
              title: Text(state.profile!.username),
              subtitle: const Text('Username'),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(state.profile!.email),
              subtitle: const Text('Email'),
            ),
          ],
        ),
      ),
    );
  }
}
