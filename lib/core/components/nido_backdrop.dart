import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Fondo con degradado morado y resplandor cálido arriba.
///
/// - Splash e Inicio: `AppGradients.home` (4 paradas) a pantalla completa, resplandor del 34% de alto.
/// - Panel del onboarding: `AppGradients.onboarding`, 470 de alto y radio inferior 44
///   (pasa `height: 470` y `borderRadius: AppRadius.onboardingHeroBottom`).
/// El resplandor es un radial circular; el diseño usa una elipse, así que es una aproximación.
class NidoGradientBackground extends StatelessWidget {
  const NidoGradientBackground({
    super.key,
    this.child,
    this.gradient = AppGradients.home,
    this.height,
    this.borderRadius,
    this.glowHeightFactor = 0.34,
  });

  final Widget? child;
  final Gradient gradient;

  /// Alto fijo; si es null ocupa todo el espacio disponible.
  final double? height;
  final BorderRadius? borderRadius;
  final double glowHeightFactor;

  @override
  Widget build(BuildContext context) {
    final box = DecoratedBox(
      decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor: glowHeightFactor,
                widthFactor: 1,
                child: const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.homeGlow)),
              ),
            ),
            ?child,
          ],
        ),
      ),
    );
    return height == null ? box : SizedBox(height: height, child: box);
  }
}
