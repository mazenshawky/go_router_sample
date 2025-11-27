import 'package:flutter/material.dart';
import 'package:go_router_sample/core/routing/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'GoRouter with BottomNavigationBar',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
