import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.result)),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.6,
                widthFactor: 1,
                child: DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.resultGlow)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 110, 28, 34),
              child: Column(
                children: [
                  Text('Aguanta\nun momento', textAlign: TextAlign.center, style: AppTextStyles.heroTitle),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Podrías ser elegible para una oferta. Alguien del equipo se pondrá en contacto contigo pronto.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLg,
                    ),
                  ),
                  const Expanded(child: Center(child: NidoOrbRings())),
                  NidoButton(
                    label: 'Ver mis ofertas',
                    variant: NidoButtonVariant.light,
                    height: 56,
                    onPressed: () => context.go(AppRoutes.offers),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
