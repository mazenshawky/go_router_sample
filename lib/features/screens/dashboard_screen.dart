import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/core/routing/app_paths.dart';
import 'package:go_router_sample/core/routing/routing_keys.dart';
import 'package:go_router_sample/features/controllers/dashboard_cubit/dashboard_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardCubit cubit;
  int _count = 0;

  @override
  void initState() {
    cubit = context.read<DashboardCubit>();
    super.initState();
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $_count',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _increment,
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.push(
                  '${AppPaths.dashboardPath}${AppPaths.itemDetailsPath}',
                  extra: {RoutingKeys.count: _count},
                );
              },
              child: const Text('Go to Item details'),
            ),
          ],
        ),
      ),
    );
  }
}
