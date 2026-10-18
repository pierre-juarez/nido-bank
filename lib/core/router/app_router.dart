import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/features/gallery/presentation/screens/components_gallery.dart';
import 'package:nido_bank/features/home/presentation/screens/home_screen.dart';
import 'package:nido_bank/features/manage/presentation/screens/manage_screens.dart';
import 'package:nido_bank/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:nido_bank/features/search/presentation/screens/search_screens.dart';
import 'package:nido_bank/features/shell/presentation/screens/main_shell.dart';
import 'package:nido_bank/features/splash/presentation/screens/android_splash_screen.dart';

/// Flujo de arranque: splash nativo → splash de Flutter → onboarding → galería.
final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      // Android e iOS arrancan con un splash nativo (fondo sólido + casita); este lo continúa sin que se note el cambio.
      builder: (context, state) => NidoAndroidSplashScreen(onFinished: () => context.go(AppRoutes.onboarding)),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => NidoOnboardingScreen(onFinished: () => context.go(AppRoutes.home)),
    ),
    // Fuera del shell: pantalla completa, sin barra de pestañas.
    GoRoute(path: AppRoutes.search, builder: (context, state) => const SearchScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: AppRoutes.home, builder: (context, state) => const HomeScreen())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: AppRoutes.manage, builder: (context, state) => const ManageScreen())],
        ),
      ],
    ),
    GoRoute(path: AppRoutes.components, builder: (context, state) => const ComponentsGallery()),
  ],
);
