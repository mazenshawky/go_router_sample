import 'package:get_it/get_it.dart';
import 'package:go_router_sample/features/controllers/dashboard_cubit/dashboard_cubit.dart';
import 'package:go_router_sample/features/controllers/item_details/item_details_cubit.dart';
import 'package:go_router_sample/features/controllers/profile_cubit/profile_cubit.dart';
import 'package:go_router_sample/features/controllers/settings_cubit/settings_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupGetIt() async {
  sl.registerFactory<DashboardCubit>(() => DashboardCubit());
  sl.registerFactory<ProfileCubit>(() => ProfileCubit());
  sl.registerFactory<SettingsCubit>(() => SettingsCubit());
  sl.registerFactory<ItemDetailsCubit>(() => ItemDetailsCubit());
}
