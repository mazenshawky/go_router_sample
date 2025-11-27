import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_sample/core/bloc_observer/bloc_observer.dart';
import 'package:go_router_sample/core/di/service_locator.dart';
import 'package:go_router_sample/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await setupGetIt();
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
