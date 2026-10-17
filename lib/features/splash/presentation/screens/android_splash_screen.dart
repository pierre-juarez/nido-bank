import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

/// Valores compartidos con el pre-splash nativo de Android (ver `android/app/src/main/res`).
abstract final class NidoAndroidSplash {
  /// Color de fondo sólido del splash nativo. Es night500; en Android vive en `@color/nido_splash_bg`.
  static const nativeColor = AppColors.night500;

  /// Tamaño de la casita blanca. Es el mismo que dibuja `ic_splash_house.xml`.
  static const markSize = 52.0;
}

/// Splash de Flutter para Android, que continúa el splash nativo sin que se note el cambio.
///
/// Línea de tiempo (900 ms de relevo + barra):
/// 1. 0–200 ms: primer fotograma igual al nativo, fondo sólido `night500` y casita blanca de 52 en el centro.
/// 2. 200–900 ms: el degradado aparece sobre el fondo; la casita se queda y detrás crece el cuadro blanco
///    de 52 a 96 (la casita pasa de blanco a `primary500`) mientras todo sube 55 dp hacia su sitio final.
/// 3. Al terminar el relevo: entran el wordmark con el lema y la barra de 120 × 4 (2 s por defecto).
/// Al acabar la barra llama a [onFinished]. Tocar la pantalla salta la espera.
///
/// El resultado final es idéntico a [NidoSplashScreen].
class NidoAndroidSplashScreen extends StatefulWidget {
  const NidoAndroidSplashScreen({
    super.key,
    required this.onFinished,
    this.barDuration = const Duration(milliseconds: 2000),
  });

  final VoidCallback onFinished;
  final Duration barDuration;

  @override
  State<NidoAndroidSplashScreen> createState() => _NidoAndroidSplashScreenState();
}

class _NidoAndroidSplashScreenState extends State<NidoAndroidSplashScreen> with SingleTickerProviderStateMixin {
  static const _tileSize = 96.0;
  static const _gap = 20.0;
  // Alto del bloque de texto: wordmark 60 × 1.0 + 8 + lema 17 × 1.3.
  static const _textHeight = 60.0 + 8.0 + 17.0 * 1.3;

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  late final Animation<double> _gradient =
      CurvedAnimation(parent: _controller, curve: const Interval(0.22, 1, curve: Curves.easeOut));
  late final Animation<double> _tile =
      CurvedAnimation(parent: _controller, curve: const Interval(0.22, 1, curve: Cubic(0.2, 0.8, 0.2, 1)));

  bool _showText = false;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _controller.forward().whenComplete(() {
      if (mounted) setState(() => _showText = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _finish() {
    if (_done) return;
    _done = true;
    widget.onFinished();
  }

  Widget _textBlock() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('nido', style: AppTextStyles.wordmark),
          const SizedBox(height: 8),
          Text('Menos papeleo, más hogar.', style: AppTextStyles.tagline),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: NidoAndroidSplash.nativeColor,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _finish,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FadeTransition(opacity: _gradient, child: const NidoGradientBackground()),
              Center(
                child: AnimatedBuilder(
                  animation: _tile,
                  builder: (context, _) {
                    final t = _tile.value;
                    // Al empezar, la casita está en el centro exacto de la pantalla, como en el splash nativo.
                    final shift = (_gap + _textHeight) / 2 * (1 - t);
                    return Transform.translate(
                      offset: Offset(0, shift),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: _tileSize,
                            height: _tileSize,
                            child: Center(child: _MorphTile(t)),
                          ),
                          const SizedBox(height: _gap),
                          _showText
                              ? NidoEntrance(child: _textBlock())
                              : Opacity(opacity: 0, child: _textBlock()),
                        ],
                      ),
                    );
                  },
                ),
              ),
              if (_showText)
                Positioned(
                  bottom: 96,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: NidoEntrance(
                      offsetY: 0,
                      beginScale: 1,
                      child: NidoTimedProgressBar(duration: widget.barDuration, onCompleted: _finish),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Cuadro blanco que crece detrás de la casita: de 52 a 96, con la casita pasando de blanco a primary500.
class _MorphTile extends StatelessWidget {
  const _MorphTile(this.t);

  final double t;

  @override
  Widget build(BuildContext context) {
    final size = NidoAndroidSplash.markSize + (96 - NidoAndroidSplash.markSize) * t;
    final markColor = Color.lerp(AppColors.white, AppColors.primary500, t)!;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.95 * t),
        borderRadius: BorderRadius.circular(size * 28 / 96),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(26, 18, 96, 0.5 * t),
            offset: const Offset(0, 22),
            blurRadius: 44,
            spreadRadius: -18,
          ),
        ],
      ),
      child: SvgPicture.string(
        NidoLogoTile.markSvg('#000000'),
        width: NidoAndroidSplash.markSize,
        height: NidoAndroidSplash.markSize,
        colorFilter: ColorFilter.mode(markColor, BlendMode.srcIn),
      ),
    );
  }
}
