import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Iconos de trazo de Nido: cuadrícula de 24, trazo de 2, extremos y uniones
/// redondeados, sin relleno. Cada constante es el interior del <svg>.
abstract final class NidoIcons {
  static const home = '<path d="M3 11l9-7 9 7v9a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z"/>';
  static const sliders =
      '<path d="M4 7h9M19 7h1M4 17h1M11 17h9"/><circle cx="16" cy="7" r="2.5"/><circle cx="8" cy="17" r="2.5"/>';
  static const borrow = '<circle cx="9" cy="12" r="6"/><circle cx="16" cy="12" r="5"/>';
  static const search = '<circle cx="11" cy="11" r="6.5"/><path d="M16 16l4 4"/>';
  static const arrowRight = '<path d="M5 12h14M13 6l6 6-6 6"/>';
  static const arrowLeft = '<path d="M19 12H5M11 6l-6 6 6 6"/>';
  static const close = '<path d="M6 6l12 12M18 6L6 18"/>';
  static const document = '<path d="M7 3h7l5 5v11a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2z"/><path d="M9 13h6M9 17h4"/>';
  static const calendar = '<rect x="3.5" y="5" width="17" height="15" rx="3"/><path d="M8 3v4M16 3v4M3.5 10h17"/>';
  static const wallet = '<path d="M4 8a2 2 0 0 1 2-2h11v4"/><rect x="4" y="8" width="16" height="11" rx="3"/>';
  static const coin = '<circle cx="12" cy="12" r="8.5"/><path d="M9 12h6M12 9v6"/>';
  static const shield = '<path d="M12 3l7 3v5c0 4.5-3 8-7 10-4-2-7-5.5-7-10V6z"/><path d="M9 12l2 2 4-4"/>';
  static const clock = '<circle cx="12" cy="12" r="8.5"/><path d="M12 7.5V12l3 2"/>';
}

/// Dibuja un icono de [NidoIcons] del tamaño y color pedidos.
/// Medidas del diseño: 20 dentro de cuadros de icono y barra de navegación,
/// 18 en botones circulares, 12 con trazo de 3 en el chip "Eliminar".
class NidoIcon extends StatelessWidget {
  const NidoIcon(this.body, {super.key, this.size = 20, this.color = Colors.white, this.strokeWidth = 2});

  final String body;
  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final svg =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" '
        'stroke="#000000" stroke-width="$strokeWidth" stroke-linecap="round" stroke-linejoin="round">$body</svg>';
    return SvgPicture.string(svg, width: size, height: size, colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  }
}
