import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_icons.dart';

enum NidoButtonVariant { primary, light, soft }

/// Botón de acción de Nido: alto fijo, forma de píldora, texto en peso 800.
///
/// Medidas por defecto:
/// - primary: alto 56 (AppSize.ctaHeight), gradiente cta, sombra cta, texto 16/800 blanco.
/// - light:   alto 50 (AppSize.buttonHeight), fondo blanco, texto 15/800 ink900.
/// - soft:    alto 50 (48 en "Ver progreso en el tiempo"), fondo surfaceSoftButton, texto 15/700.
/// Con [expand] = false el botón ocupa solo su texto más [horizontalPadding] (34) a cada lado.
class NidoButton extends StatelessWidget {
  const NidoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = NidoButtonVariant.primary,
    this.height,
    this.expand = true,
    this.horizontalPadding = 34,
    this.backgroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final NidoButtonVariant variant;
  final double? height;
  final bool expand;
  final double horizontalPadding;

  /// Sustituye el fondo de las variantes light y soft (por ejemplo white92 sobre gradient manage).
  final Color? backgroundColor;

  double get _height => height ?? (variant == NidoButtonVariant.primary ? AppSize.ctaHeight : AppSize.buttonHeight);

  @override
  Widget build(BuildContext context) {
    final h = _height;
    final radius = BorderRadius.circular(h / 2);

    final style = switch (variant) {
      NidoButtonVariant.primary => AppTextStyles.buttonLg,
      NidoButtonVariant.light => AppTextStyles.buttonMd,
      NidoButtonVariant.soft => AppTextStyles.buttonSoft,
    };

    final decoration = switch (variant) {
      NidoButtonVariant.primary => BoxDecoration(
          gradient: AppGradients.cta,
          borderRadius: radius,
          boxShadow: AppShadows.cta,
        ),
      NidoButtonVariant.light => BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius: radius,
        ),
      NidoButtonVariant.soft => BoxDecoration(
          color: backgroundColor ?? AppColors.surfaceSoftButton,
          borderRadius: radius,
        ),
    };

    return SizedBox(
      height: h,
      width: expand ? double.infinity : null,
      child: DecoratedBox(
        decoration: decoration,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onPressed,
            borderRadius: radius,
            child: Center(
              widthFactor: expand ? null : 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: expand ? 0 : horizontalPadding),
                child: Text(label, style: style, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Chip de acción: píldora pequeña.
/// - "Eliminar" sobre morado: alto 30, padding lateral 12, fondo glass20, texto blanco 13/700, icono × de 12.
/// - "Saltar": alto 36, padding lateral 16, fondo surfaceChip, texto ink900.
class NidoChip extends StatelessWidget {
  const NidoChip({
    super.key,
    required this.label,
    required this.onPressed,
    this.background = AppColors.glass20,
    this.foreground = AppColors.white,
    this.height = 30,
    this.horizontalPadding = 12,
    this.showCloseIcon = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color background;
  final Color foreground;
  final double height;
  final double horizontalPadding;
  final bool showCloseIcon;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(height / 2);
    return Material(
      color: background,
      borderRadius: radius,
      child: InkWell(
        onTap: onPressed,
        borderRadius: radius,
        child: SizedBox(
          height: height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: AppTextStyles.chip.copyWith(color: foreground)),
                if (showCloseIcon) ...[
                  const SizedBox(width: 6),
                  NidoIcon(NidoIcons.close, size: 12, strokeWidth: 3, color: foreground),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
