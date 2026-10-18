import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_icons.dart';

/// Fila de acción "Hacer un pago" (Gestionar): avatar con texto, título, apoyo y botón circular con flecha.
///
/// Medidas (dp):
/// - Fila: fondo white, radio 28, padding 14 vertical y 16 horizontal, separación de 12 entre bloques.
/// - Avatar: círculo de 44 en primary100 con el texto ("S/") en 15/800 primary500.
/// - Texto: título 16/800 (rowTitleLg) y apoyo 13/600 text-muted (caption), 1 de separación; ocupa el espacio libre.
/// - Botón final: círculo de 36 en surfaceChip con flecha de 18, trazo 2.2, ink900.
/// Toda la fila es tocable.
class NidoPaymentRow extends StatelessWidget {
  const NidoPaymentRow({super.key, required this.title, required this.subtitle, required this.onTap, this.leadingLabel = 'S/'});

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  /// Texto dentro del avatar.
  final String leadingLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: AppRadius.r28,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r28,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: AppColors.primary100, shape: BoxShape.circle),
                child: Text(leadingLabel, style: AppTextStyles.rowTitle.copyWith(color: AppColors.primary500)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.rowTitleLg),
                    const SizedBox(height: 1),
                    Text(subtitle, style: AppTextStyles.caption),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: AppColors.surfaceChip, shape: BoxShape.circle),
                child: const NidoIcon(NidoIcons.arrowRight, size: 18, strokeWidth: 2.2, color: AppColors.ink900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
