import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'info_rows.dart';

/// Mosaico de dato de Gestionar: icono, etiqueta y un número grande ("10", "12 de cada mes").
///
/// Medidas (dp):
/// - Mosaico: fondo white, radio 26, padding 16 en los cuatro lados, separación de 10 entre el icono y el texto.
/// - Icono: cuadro de 40 con radio 12 y el icono a 22 (usa [NidoIconTile] con `iconSize: 22`).
/// - Etiqueta: 13/700 text-muted (captionStrong), interlineado 1.25.
/// - Número: 32/800 con tracking -0.03em (amountLg), a 2 de la etiqueta.
/// - Con [suffix] ("de cada mes"): el número y el texto van en una línea por la base, a 6 uno del otro;
///   el texto es 12/600 text-muted.
/// En Gestionar van dos mosaicos de igual ancho y alto, a 12 uno del otro: usa [NidoStatTilePair].
class NidoStatTile extends StatelessWidget {
  const NidoStatTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.label,
    required this.value,
    this.suffix,
  });

  final String icon;
  final Color iconColor;
  final Color iconBackground;
  final String label;
  final String value;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppColors.white, borderRadius: AppRadius.r26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          NidoIconTile(icon: icon, iconColor: iconColor, background: iconBackground, iconSize: 22),
          const SizedBox(height: 10),
          Text(label, style: AppTextStyles.captionStrong),
          const SizedBox(height: 2),
          if (suffix == null)
            Text(value, style: AppTextStyles.amountLg)
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value, style: AppTextStyles.amountLg),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(suffix!, style: AppTextStyles.labelSm.copyWith(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Dos [NidoStatTile] lado a lado: mismo ancho, misma altura y 12 de separación.
class NidoStatTilePair extends StatelessWidget {
  const NidoStatTilePair({super.key, required this.left, required this.right});

  final NidoStatTile left;
  final NidoStatTile right;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: left),
          const SizedBox(width: 12),
          Expanded(child: right),
        ],
      ),
    );
  }
}
