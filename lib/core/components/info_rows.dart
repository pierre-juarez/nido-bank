import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_icons.dart';

/// Cuadro de icono: 40 × 40 (38 en los mosaicos), radio 12, icono de 20 con trazo de 2.
/// Pares de color: primary100/primary500, pink100/pink600, green100/green600,
/// blue100/blue600, red100/red600.
class NidoIconTile extends StatelessWidget {
  const NidoIconTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.background,
    this.size = AppSize.iconTile,
    this.iconSize = 20,
  });

  final String icon;
  final Color iconColor;
  final Color background;
  final double size;

  /// Tamaño del icono dentro del cuadro: 20 en filas y mosaicos, 22 en los mosaicos de Gestionar.
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background, borderRadius: AppRadius.r12),
      child: NidoIcon(icon, size: iconSize, color: iconColor),
    );
  }
}

/// Fila informativa (pantalla Buscar).
/// Medidas: fondo surfaceTint100, radio 22, padding 14 vertical y 16 horizontal,
/// cuadro de icono de 40, separación 14 hasta el texto; título 15/800 y apoyo 13/600 con 1 de separación.
/// Entre filas, 12.
class NidoInfoRow extends StatelessWidget {
  const NidoInfoRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    this.subtitle,
  });

  final String icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(color: AppColors.surfaceTint100, borderRadius: AppRadius.r22),
      child: Row(
        children: [
          NidoIconTile(icon: icon, iconColor: iconColor, background: iconBackground),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.rowTitle),
                if (subtitle != null) ...[const SizedBox(height: 1), Text(subtitle!, style: AppTextStyles.caption)],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Mosaico de factor (pantalla En revisión).
/// Medidas: fondo surfaceTint50, radio 22, padding 14, cuadro de icono de 38,
/// separación 12 hasta el título 14/800 (interlineado 1.2).
class NidoInfoTile extends StatelessWidget {
  const NidoInfoTile({super.key, required this.icon, required this.iconColor, required this.iconBackground, required this.title});

  final String icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(color: AppColors.surfaceTint50, borderRadius: AppRadius.r22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NidoIconTile(icon: icon, iconColor: iconColor, background: iconBackground, size: 38),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.tileTitle),
        ],
      ),
    );
  }
}

/// Cuadrícula de 2 columnas con 10 de separación horizontal y vertical.
/// Cada fila toma la altura del mosaico más alto, como una cuadrícula CSS.
class NidoTileGrid extends StatelessWidget {
  const NidoTileGrid({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += 2) {
      if (rows.isNotEmpty) rows.add(const SizedBox(height: AppSpacing.s10));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: children[i]),
              const SizedBox(width: AppSpacing.s10),
              Expanded(child: i + 1 < children.length ? children[i + 1] : const SizedBox.shrink()),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
