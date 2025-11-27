import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeView extends CustomTransitionPage<void> {
  FadeView({required Widget page})
    : super(
        child: page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
}
