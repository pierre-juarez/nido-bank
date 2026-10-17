import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/features/gallery/presentation/screens/components_gallery.dart';
import 'package:nido_bank/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:nido_bank/features/splash/presentation/screens/android_splash_screen.dart';
import 'package:nido_bank/features/splash/presentation/screens/splash_screen.dart';

/// Flujo de arranque: splash nativo → splash de Flutter → onboarding → galería.
final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) {
        void next() => context.go(AppRoutes.onboarding);
        // En Android el splash de Flutter continúa el nativo sin que se note el cambio.
        final isAndroid = !kIsWeb && Platform.isAndroid;
        return isAndroid ? NidoAndroidSplashScreen(onFinished: next) : NidoSplashScreen(onFinished: next);
      },
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
