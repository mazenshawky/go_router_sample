import 'package:go_router/go_router.dart';
import 'package:go_router_sample/core/routing/app_animation_route.dart';
import 'package:go_router_sample/core/routing/app_paths.dart';
import 'package:go_router_sample/core/routing/routing_keys.dart';
import 'package:go_router_sample/screens/dashboard_screen.dart';
import 'package:go_router_sample/screens/home_screen.dart';
import 'package:go_router_sample/screens/item_details_screen.dart';
import 'package:go_router_sample/screens/profile_screen.dart';
import 'package:go_router_sample/screens/settings_screen.dart';
import 'package:go_router_sample/screens/splash_screen.dart';

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
          return HomeScreen(navigationShell: navigationShell);
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
                        page: ItemDetailsScreen(
                          count: extra[RoutingKeys.count],
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
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppPaths.settingsPath,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
