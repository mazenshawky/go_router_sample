import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/core/routing/app_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  void _startDelay() {
    timer = Timer(const Duration(seconds: 3), () {
      context.go(AppPaths.dashboardPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Welcome...')));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
