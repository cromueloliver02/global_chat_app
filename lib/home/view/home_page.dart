import 'package:flutter/material.dart';

import 'package:global_chat/home/widgets/home_app_bar.dart';
import 'package:global_chat/home/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'home';
  static const String routePath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      drawer: HomeDrawer(),
      body: Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}
