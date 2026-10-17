import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Barra de progreso fina de nido.
///
/// Medidas: 120 x 4, radio 2 (alto / 2), pista glass20, relleno white. En el splash va a 96 del borde inferior.
/// Usa [NidoProgressBar] cuando controlas el valor y [NidoTimedProgressBar] cuando solo quieres que corra sola.
class NidoProgressBar extends StatelessWidget {
  const NidoProgressBar({
    super.key,
    required this.value,
    this.width = 120,
    this.height = 4,
    this.trackColor = AppColors.glass20,
    this.fillColor = AppColors.white,
  });

  /// Avance de 0 a 1.
  final double value;
  final double width;
  final double height;
  final Color trackColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(height / 2);
    return ClipRRect(
      borderRadius: radius,
      child: Container(
        width: width,
        height: height,
        color: trackColor,
        alignment: Alignment.centerLeft,
        child: Container(
          width: width * value.clamp(0.0, 1.0),
          height: height,
          decoration: BoxDecoration(color: fillColor, borderRadius: radius),
        ),
      ),
    );
  }
}

/// Barra que avanza sola de 0 a 1 en [duration] (2.4 s en el splash), de forma lineal.
class NidoTimedProgressBar extends StatefulWidget {
  const NidoTimedProgressBar({
    super.key,
    this.duration = const Duration(milliseconds: 2400),
    this.onCompleted,
    this.width = 120,
    this.height = 4,
  });

  final Duration duration;
  final VoidCallback? onCompleted;
  final double width;
  final double height;

  @override
  State<NidoTimedProgressBar> createState() => _NidoTimedProgressBarState();
}

class _NidoTimedProgressBarState extends State<NidoTimedProgressBar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: widget.duration);

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onCompleted?.call();
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) =>
          NidoProgressBar(value: _controller.value, width: widget.width, height: widget.height),
    );
  }
}
