import 'package:flutter/material.dart';

import 'package:global_chat/profile/widgets/profile_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = 'profile';
  static const String routePath = routeName;

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
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
