import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Indicadores de página del onboarding.
///
/// Medidas: alto 8, separación 8; el punto activo mide 24 de ancho en primary500 y los demás 8 en track.
/// El cambio de ancho dura 250 ms.
class NidoPageDots extends StatelessWidget {
  const NidoPageDots({
    super.key,
    required this.count,
    required this.index,
    this.size = 8,
    this.gap = 8,
    this.activeWidth = 24,
    this.activeColor = AppColors.primary500,
    this.inactiveColor = AppColors.track,
  });

  final int count;
  final int index;
  final double size;
  final double gap;
  final double activeWidth;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) SizedBox(width: gap),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            width: i == index ? activeWidth : size,
            height: size,
            decoration: BoxDecoration(
              color: i == index ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
        ],
      ],
    );
  }
}
