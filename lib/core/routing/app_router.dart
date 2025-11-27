import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/core/di/service_locator.dart';
import 'package:go_router_sample/core/routing/app_animation_route.dart';
import 'package:go_router_sample/core/routing/app_paths.dart';
import 'package:go_router_sample/core/routing/routing_keys.dart';
import 'package:go_router_sample/features/controllers/dashboard_cubit/dashboard_cubit.dart';
import 'package:go_router_sample/features/controllers/item_details/item_details_cubit.dart';
import 'package:go_router_sample/features/controllers/profile_cubit/profile_cubit.dart';
import 'package:go_router_sample/features/controllers/settings_cubit/settings_cubit.dart';
import 'package:go_router_sample/features/screens/dashboard_screen.dart';
import 'package:go_router_sample/features/screens/home_screen.dart';
import 'package:go_router_sample/features/screens/item_details_screen.dart';
import 'package:go_router_sample/features/screens/profile_screen.dart';
import 'package:go_router_sample/features/screens/settings_screen.dart';
import 'package:go_router_sample/features/screens/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppPaths.splashPath,
    routes: [
      GoRoute(
        path: AppPaths.splashPath,
        pageBuilder: (context, state) => FadeView(page: const SplashScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BlocProvider(
            create: (_) => sl<DashboardCubit>(),
            child: HomeScreen(navigationShell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppPaths.dashboardPath,
                builder: (context, state) => const DashboardScreen(),
                routes: [
                  GoRoute(
                    path: AppPaths.itemDetailsPath,
                    pageBuilder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>;

                      return FadeView(
                        page: BlocProvider(
                          create: (_) => sl<ItemDetailsCubit>(),
                          child: ItemDetailsScreen(
                            count: extra[RoutingKeys.count],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppPaths.profilePath,
                builder: (context, state) => BlocProvider(
                  create: (_) => sl<ProfileCubit>(),
                  child: const ProfileScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppPaths.settingsPath,
                builder: (context, state) => BlocProvider(
                  create: (_) => sl<SettingsCubit>(),
                  child: const SettingsScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
