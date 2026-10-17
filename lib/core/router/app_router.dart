import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/features/gallery/presentation/screens/components_gallery.dart';
import 'package:nido_bank/features/onboarding/presentation/screens/onboarding_screen.dart';
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
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const ComponentsGallery(),
    ),
  ],
);
