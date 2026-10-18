import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_theme.dart';
import 'nido_motion.dart';

/// Ilustración de Resultado: anillos lilas con una esfera rosada que flota encima.
///
/// Medidas (dp): 300 x 170. Los anillos son un SVG de 300 x 150 centrado (10 de margen arriba y abajo);
/// la esfera mide 38 (radio 19), usa `AppGradients.orb` y flota 9 hacia arriba en 3 s.
class NidoOrbRings extends StatelessWidget {
  const NidoOrbRings({super.key});

  static const _rings = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 150" fill="none">
  <ellipse cx="150" cy="104" rx="140" ry="40" fill="#EFEBFF"/>
  <ellipse cx="150" cy="100" rx="140" ry="38" fill="#DCD6FF"/>
  <ellipse cx="150" cy="100" rx="108" ry="29" fill="#EFEBFF"/>
  <ellipse cx="150" cy="100" rx="78" ry="20" fill="#D3CCFF"/>
  <ellipse cx="150" cy="100" rx="48" ry="12" fill="#EFEBFF"/>
  <ellipse cx="150" cy="99" rx="20" ry="5" fill="#3C1E78" fill-opacity="0.28"/>
</svg>''';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 170,
      child: Stack(
        children: [
          Positioned(left: 0, top: 10, child: SvgPicture.string(_rings, width: 300, height: 150)),
          Positioned(
            left: 131,
            top: 69,
            child: NidoFloat(
              duration: const Duration(milliseconds: 1500),
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(shape: BoxShape.circle, gradient: AppGradients.orb),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
