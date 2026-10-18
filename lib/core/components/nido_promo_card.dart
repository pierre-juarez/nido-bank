import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_illustrations.dart';
import 'nido_motion.dart';

/// Tarjeta promocional de Gestionar ("Pide una nueva hipoteca") con la llave flotante.
///
/// Medidas (dp):
/// - Tarjeta: alto 128, radio 28, fondo `AppGradients.brand`, padding 20, sin sombra; recorta lo que sobresale.
/// - Texto: abajo a la izquierda; título 20/800 con tracking -0.4 en blanco, 2 de separación, subtítulo
///   13/600 en onPrimaryMuted.
/// - Llave: 120 x 96 a 6 del borde derecho y 2 del superior, flotando (3 s, sube 9). La parte que sube
///   queda recortada por la tarjeta, igual que en el prototipo.
class NidoPromoCard extends StatelessWidget {
  const NidoPromoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.illustration = NidoIllustrations.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  /// SVG de la ilustración; por defecto la llave.
  final String illustration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: ClipRRect(
        borderRadius: AppRadius.r28,
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: const BoxDecoration(gradient: AppGradients.brand),
            child: InkWell(
              onTap: onTap,
              child: Stack(
                children: [
                  Positioned(
                    top: 2,
                    right: 6,
                    child: NidoFloat(
                      duration: const Duration(milliseconds: 1500),
                      child: NidoIllustration(illustration, width: 120, height: 96),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.rowTitleLg.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.4,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(subtitle, style: AppTextStyles.caption.copyWith(color: AppColors.onPrimaryMuted)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
