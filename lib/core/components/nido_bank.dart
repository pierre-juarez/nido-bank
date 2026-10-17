import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Avatar circular con las iniciales del banco.
/// Medidas: 34 en la tarjeta morada, 32 en Inicio, 24 dentro de la cápsula.
/// Texto 12/800 (9/800 cuando el tamaño es 24 o menos).
class NidoBankAvatar extends StatelessWidget {
  const NidoBankAvatar({
    super.key,
    required this.initials,
    this.size = AppSize.bankAvatar,
    this.background = AppColors.white,
    this.foreground = AppColors.ink900,
  });

  final String initials;
  final double size;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    final fontSize = size <= 24 ? 9.0 : 12.0;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Text(
        initials,
        style: AppTextStyles.buttonMd.copyWith(fontSize: fontSize, color: foreground),
      ),
    );
  }
}

/// Cápsula del banco de la hoja de edición.
/// Medidas: alto 36, radio 18, fondo surfaceChip, padding izquierdo 6 y derecho 14,
/// avatar de 24 (ink900 con texto blanco), separación 8, nombre 13/700.
class NidoBankChip extends StatelessWidget {
  const NidoBankChip({super.key, required this.initials, required this.name});

  final String initials;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.fromLTRB(6, 0, 14, 0),
      decoration: BoxDecoration(
        color: AppColors.surfaceChip,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NidoBankAvatar(
            initials: initials,
            size: 24,
            background: AppColors.ink900,
            foreground: AppColors.white,
          ),
          const SizedBox(width: 8),
          Text(name, style: AppTextStyles.chip),
        ],
      ),
    );
  }
}
