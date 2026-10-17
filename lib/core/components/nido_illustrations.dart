import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Ilustraciones de Nido embebidas como SVG (mismas de assets/Illustrations).
/// Tamaños del diseño: casa 240 x 192 y llave 250 x 205 en el onboarding (132 x 106 en Inicio),
/// avión 290 x 145 en el onboarding (230 x 104 en En revisión).
abstract final class NidoIllustrations {
  static const house = r'''<svg xmlns="http://www.w3.org/2000/svg" width="150" height="120" viewBox="0 0 150 120" fill="none">
  <defs>
    <linearGradient id="houseBody" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#FF8AE0"/>
      <stop offset="1" stop-color="#B533D1"/>
    </linearGradient>
    <linearGradient id="houseRoof" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#FFC2EE"/>
      <stop offset="1" stop-color="#E056D6"/>
    </linearGradient>
  </defs>
  <ellipse cx="75" cy="109" rx="52" ry="7" fill="#3C1478" fill-opacity="0.18"/>
  <rect x="30" y="50" width="90" height="56" rx="12" fill="url(#houseBody)"/>
  <path d="M16 56L70 14a8 8 0 0 1 10 0l54 42a6 6 0 0 1-4 11H20a6 6 0 0 1-4-11z" fill="url(#houseRoof)"/>
  <rect x="64" y="74" width="22" height="32" rx="7" fill="#FFE6F7"/>
  <rect x="94" y="68" width="16" height="16" rx="5" fill="#FFE6F7"/>
</svg>''';
  static const key = r'''<svg xmlns="http://www.w3.org/2000/svg" width="110" height="90" viewBox="0 0 110 90" fill="none">
  <defs>
    <linearGradient id="keyGold" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#FFF0C2"/>
      <stop offset="1" stop-color="#F2B94B"/>
    </linearGradient>
  </defs>
  <path fill="url(#keyGold)" fill-rule="evenodd" d="M8 40a26 26 0 1 0 52 0a26 26 0 1 0 -52 0Z M24 40a10 10 0 1 0 20 0a10 10 0 1 0 -20 0Z"/>
  <rect x="54" y="34" width="48" height="13" rx="6.5" fill="url(#keyGold)"/>
  <rect x="86" y="44" width="9" height="17" rx="4" fill="url(#keyGold)"/>
  <rect x="70" y="44" width="9" height="12" rx="4" fill="url(#keyGold)"/>
</svg>''';
  static const paperPlane = r'''<svg xmlns="http://www.w3.org/2000/svg" width="220" height="110" viewBox="0 0 220 110" fill="none">
  <polygon points="10,60 210,8 112,66" fill="#FFFFFF"/>
  <polygon points="112,66 210,8 128,98" fill="#C4D3EE"/>
  <polygon points="112,66 128,98 104,84" fill="#8FA4CF"/>
</svg>''';
}

/// Dibuja una ilustración SVG a un tamaño fijo.
class NidoIllustration extends StatelessWidget {
  const NidoIllustration(this.svg, {super.key, required this.width, required this.height});

  final String svg;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SvgPicture.string(svg, width: width, height: height);
}
