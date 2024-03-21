import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/core/res/app_images.dart';
import 'package:global_chat/profile/view/profile_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  void _signOut(BuildContext ctx) {
    ctx.read<AuthBloc>().add(const AuthSignedOut());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 20,
              ),
              child: Image.asset(AppImages.splash),
            ),
            ListTile(
              leading: const Icon(Icons.person, size: 30),
              title: const Text('Profile'),
              onTap: () => context.goNamed(ProfilePage.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.logout, size: 30),
              title: const Text('Logout'),
              onTap: () => _signOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
