import 'package:go_router/go_router.dart';
import 'package:go_router_sample/core/routing/app_animation_route.dart';
import 'package:go_router_sample/core/routing/app_paths.dart';
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
            pageBuilder: (context, state) =>
                FadeView(page: const SplashScreen()),
          ),
      ShellRoute(
        pageBuilder: (context, state, child) =>
            FadeView(page: HomeScreen(child: child)),
        routes: [
          GoRoute(
            path: AppPaths.dashboardPath,
            pageBuilder: (context, state) =>
                FadeView(page: const DashboardScreen()),
            routes: [
              GoRoute(
                path: AppPaths.itemDetailsPath,
                pageBuilder: (context, state) =>
                    FadeView(page: const ItemDetailsScreen()),
              ),
            ],
          ),
          GoRoute(
            path: AppPaths.profilePath,
            pageBuilder: (context, state) =>
                FadeView(page: const ProfileScreen()),
          ),
          GoRoute(
            path: AppPaths.settingsPath,
            pageBuilder: (context, state) =>
                FadeView(page: const SettingsScreen()),
          ),
        ],
      ),
    ],
  );
}
