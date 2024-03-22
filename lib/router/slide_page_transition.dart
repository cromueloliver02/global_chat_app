import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SlidePageTransition extends CustomTransitionPage {
  SlidePageTransition({
    required super.key,
    required super.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (ctx, anim, secondAnim, child) => SlideTransition(
            position: Tween(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ).animate(anim),
            child: child,
          ),
        );
}
