import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Loader de búsqueda: tres aros que se expanden y desvanecen alrededor de una esfera rosada.
///
/// Medidas (dp):
/// - Lienzo: 200 x 200, todo centrado.
/// - Aros: 3 círculos de 120 con borde de 3 en primary500.
/// - Pulso: 1.8 s en bucle, curva easeOut; escala de 0.7 a 1.5 y opacidad de 0.85 a 0.
///   Los aros van desfasados un tercio de ciclo (0, 0.6 y 1.2 s).
/// - Esfera: 64, degradado `AppGradients.orb` y sombra 0 14 24 -8 en magenta600 al 60%.
class NidoSearchLoader extends StatefulWidget {
  const NidoSearchLoader({super.key, this.size = 200});

  final double size;

  @override
  State<NidoSearchLoader> createState() => _NidoSearchLoaderState();
}

class _NidoSearchLoaderState extends State<NidoSearchLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))
    ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _ring(int index) {
    // Cada aro va un tercio de ciclo por detrás del anterior.
    final phase = (_controller.value - index / 3 + 1) % 1.0;
    final eased = Curves.easeOut.transform(phase);
    return Opacity(
      opacity: 0.85 * (1 - eased),
      child: Transform.scale(
        scale: 0.7 + 0.8 * eased,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary500, width: 3),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Stack(
          alignment: Alignment.center,
          children: [
            _ring(0),
            _ring(1),
            _ring(2),
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppGradients.orb,
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(196, 46, 124, 0.6), offset: Offset(0, 14), blurRadius: 24, spreadRadius: -8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
