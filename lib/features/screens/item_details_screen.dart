import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_sample/features/controllers/dashboard_cubit/dashboard_cubit.dart';
import 'package:go_router_sample/features/controllers/item_details/item_details_cubit.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key, required this.count});

  final int count;

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  late final ItemDetailsCubit cubit;
  late final DashboardCubit dashboardCubit;

  @override
  void initState() {
    cubit = context.read<ItemDetailsCubit>();
    dashboardCubit = context.read<DashboardCubit>();
    dashboardCubit.temporaryTrial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Item details Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Count was: ${widget.count}', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
