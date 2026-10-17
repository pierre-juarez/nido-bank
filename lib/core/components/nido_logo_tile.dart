import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_theme.dart';

/// Cuadro con la marca de nido (casa con punto).
///
/// - Splash ("icon white"): 96 x 96, radio 28, fondo white95, marca de 52 en primary500, sombra cardHome.
/// - Versión morada (logo de la app): [LogoTileStyle.brand], 88 x 88, radio 26, gradiente brand, marca blanca de 48.
enum LogoTileStyle { white, brand }

class NidoLogoTile extends StatelessWidget {
  const NidoLogoTile({
    super.key,
    this.style = LogoTileStyle.white,
    this.size,
  });

  final LogoTileStyle style;

  /// Lado del cuadro. Por defecto 96 (white) u 88 (brand); radio y marca se escalan.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final isWhite = style == LogoTileStyle.white;
    final side = size ?? (isWhite ? 96.0 : 88.0);
    final scale = side / (isWhite ? 96.0 : 88.0);
    final radius = (isWhite ? 28.0 : 26.0) * scale;
    final mark = (isWhite ? 52.0 : 48.0) * scale;
    final hex = isWhite ? '#5B3DF5' : '#FFFFFF';

    return Container(
      width: side,
      height: side,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isWhite ? AppColors.white95 : null,
        gradient: isWhite ? null : AppGradients.brand,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: isWhite ? AppShadows.cardHome : null,
      ),
      child: SvgPicture.string(markSvg(hex), width: mark, height: mark),
    );
  }

  static String markSvg(String hex) => '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" fill="none">
  <path d="M6 22L24 7l18 15" stroke="$hex" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M12 20v18a2 2 0 0 0 2 2h20a2 2 0 0 0 2-2V20" stroke="$hex" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="24" cy="30" r="4" fill="$hex"/>
</svg>''';
}
