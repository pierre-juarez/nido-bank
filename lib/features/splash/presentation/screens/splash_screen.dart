import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

/// Splash de nido: fondo degradado, marca blanca, wordmark con lema y barra de carga.
///
/// Orden y tiempos: la marca entra de inmediato, el texto 150 ms después (800 ms cada uno);
/// la barra de 120 x 4 corre 2.4 s y llama a [onFinished]. Tocar la pantalla salta la espera.
/// Medidas: marca 96, separación 20, wordmark 60/800, lema 17/600 a 8 del wordmark, barra a 96 del borde inferior.
class NidoSplashScreen extends StatefulWidget {
  const NidoSplashScreen({
    super.key,
    required this.onFinished,
    this.duration = const Duration(milliseconds: 2400),
  });

  final VoidCallback onFinished;
  final Duration duration;

  @override
  State<NidoSplashScreen> createState() => _NidoSplashScreenState();
}

class _NidoSplashScreenState extends State<NidoSplashScreen> {
  bool _done = false;

  void _finish() {
    if (_done) return;
    _done = true;
    widget.onFinished();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _finish,
          child: NidoGradientBackground(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const NidoEntrance(child: NidoLogoTile()),
                      const SizedBox(height: 20),
                      NidoEntrance(
                        delay: const Duration(milliseconds: 150),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('nido', style: AppTextStyles.wordmark),
                            const SizedBox(height: 8),
                            Text('Menos papeleo, más hogar.', style: AppTextStyles.tagline),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 96,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: NidoTimedProgressBar(duration: widget.duration, onCompleted: _finish),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
