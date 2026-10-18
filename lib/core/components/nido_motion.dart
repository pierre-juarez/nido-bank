import 'package:flutter/material.dart';

/// Entrada con aparición: sube [offsetY] dp, escala de [beginScale] a 1 y pasa de 0 a 1 de opacidad.
///
/// Medidas del splash: duración 800 ms, curva cubic-bezier(.2, .8, .2, 1), sube 14, escala 0.92.
/// La marca entra sin retraso y el texto con [delay] de 150 ms.
class NidoEntrance extends StatefulWidget {
  const NidoEntrance({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 800),
    this.offsetY = 14,
    this.beginScale = 0.92,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offsetY;
  final double beginScale;

  @override
  State<NidoEntrance> createState() => _NidoEntranceState();
}

class _NidoEntranceState extends State<NidoEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curve;

  @override
  void initState() {
    super.initState();
    final total = widget.delay + widget.duration;
    _controller = AnimationController(vsync: this, duration: total);
    final start = widget.delay.inMilliseconds / total.inMilliseconds;
    _curve = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, 1, curve: const Cubic(0.2, 0.8, 0.2, 1)),
    );
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
      animation: _curve,
      child: widget.child,
      builder: (context, child) {
        final t = _curve.value;
        return Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, widget.offsetY * (1 - t)),
            child: Transform.scale(
              scale: widget.beginScale + (1 - widget.beginScale) * t,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

/// Flotación suave de las ilustraciones: sube [amplitude] dp y vuelve, en bucle.
///
/// Duraciones del diseño: casa 4 s, llave 3.6 s, avión 3.6 s, esfera 3 s. Curva easeInOut.
class NidoFloat extends StatefulWidget {
  const NidoFloat({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 4000),
    this.amplitude = 9,
  });

  final Widget child;
  final Duration duration;
  final double amplitude;

  @override
  State<NidoFloat> createState() => _NidoFloatState();
}

class _NidoFloatState extends State<NidoFloat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat(reverse: true);
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      child: widget.child,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -widget.amplitude * _curve.value),
        child: child,
      ),
    );
  }
}

/// Llegada "volando": el hijo entra desde fuera de la pantalla por la izquierda,
/// subiendo en arco y enderezándose hasta quedar en su sitio.
class NidoFlyIn extends StatefulWidget {
  const NidoFlyIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1500),
    this.startTilt = -0.4,
    this.onArrived,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;

  /// Inclinación inicial en radianes (negativa = morro hacia arriba).
  final double startTilt;
  final VoidCallback? onArrived;

  @override
  State<NidoFlyIn> createState() => _NidoFlyInState();
}

class _NidoFlyInState extends State<NidoFlyIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (!mounted) return;
      _controller.forward().whenComplete(() => widget.onArrived?.call());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return AnimatedBuilder(
      animation: _curve,
      child: widget.child,
      builder: (context, child) {
        final t = _curve.value;
        final remaining = 1 - t;
        return Opacity(
          opacity: (t * 4).clamp(0.0, 1.0),
          child: Transform.translate(
            // Entra desde la izquierda y baja en arco hasta su posición.
            offset: Offset(-width * remaining, 90 * remaining * remaining),
            child: Transform.rotate(
              angle: widget.startTilt * remaining,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
