import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Etiqueta, importe y control deslizante de "Tu parte" del pago mensual.
///
/// Medidas: etiqueta 14/600; importe 46/800; 18 de separación hasta el control; control de 24 de alto
/// (riel de 10, pulgar de 24 con borde de 7); 8 de separación hasta los extremos 12/700.
/// Rango 10 a 100 con pasos de 5 (18 divisiones). El importe es monthlyAmount × percent / 100.
class NidoShareSlider extends StatelessWidget {
  const NidoShareSlider({
    super.key,
    required this.percent,
    required this.onChanged,
    this.monthlyAmount = 900,
  });

  final double percent;
  final ValueChanged<double> onChanged;
  final double monthlyAmount;

  @override
  Widget build(BuildContext context) {
    final mine = monthlyAmount * percent / 100;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Tu pago mensual', style: AppTextStyles.labelMd),
        Text('S/ ${mine.toStringAsFixed(2)}', style: AppTextStyles.amountXl),
        const SizedBox(height: 18),
        SizedBox(
          height: 24,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: AppSize.sliderTrack,
              trackShape: const _NidoTrackShape(),
              thumbShape: const _NidoThumbShape(),
              overlayShape: SliderComponentShape.noOverlay,
              tickMarkShape: SliderTickMarkShape.noTickMark,
            ),
            child: Slider(
              value: percent,
              min: 10,
              max: 100,
              divisions: 18,
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${percent.round()}%', style: AppTextStyles.labelSm),
            Text('S/ ${monthlyAmount.toStringAsFixed(2)} · 100%', style: AppTextStyles.labelSm),
          ],
        ),
      ],
    );
  }
}

/// Riel de ancho completo con tramo relleno en degradado hasta el centro del pulgar.
/// Slider reparte el pulgar entre trackRect.left + 5 y trackRect.right - 5 (la mitad del alto del riel),
/// así que el rectángulo base se recorta 7 por lado para que el centro del pulgar vaya de 12 a ancho - 12,
/// y el riel se dibuja de nuevo a ancho completo.
class _NidoTrackShape extends SliderTrackShape {
  const _NidoTrackShape();

  static const double _inset = 7; // 24 / 2 (pulgar) - 10 / 2 (riel)

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final h = sliderTheme.trackHeight ?? AppSize.sliderTrack;
    final top = offset.dy + (parentBox.size.height - h) / 2;
    return Rect.fromLTWH(offset.dx + _inset, top, parentBox.size.width - _inset * 2, h);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final base = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final rail = Rect.fromLTRB(base.left - _inset, base.top, base.right + _inset, base.bottom);
    final radius = Radius.circular(rail.height / 2);
    final canvas = context.canvas;

    canvas.drawRRect(RRect.fromRectAndRadius(rail, radius), Paint()..color = AppColors.track);

    final active = Rect.fromLTRB(rail.left, rail.top, thumbCenter.dx, rail.bottom);
    canvas.drawRRect(
      RRect.fromRectAndRadius(active, radius),
      Paint()..shader = AppGradients.slider.createShader(rail),
    );
  }
}

/// Pulgar de 24: círculo primary500 con centro blanco de 5 de radio (borde de 7) y sombra thumb.
class _NidoThumbShape extends SliderComponentShape {
  const _NidoThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(AppSize.sliderThumb, AppSize.sliderThumb);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    canvas.drawCircle(
      center + const Offset(0, 2),
      12,
      Paint()
        ..color = const Color.fromRGBO(40, 25, 140, 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
    canvas.drawCircle(center, 12, Paint()..color = AppColors.primary500);
    canvas.drawCircle(center, 5, Paint()..color = AppColors.white);
  }
}
