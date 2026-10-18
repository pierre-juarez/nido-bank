import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_button.dart';

/// Barra inferior con total y botón de acción (pantalla Encontrada: "S/ 450 · Total mensual · Confirmar").
///
/// Medidas (dp):
/// - Barra: ancho completo, alto 104 (más el área segura inferior), fondo white, radio 28 solo arriba,
///   sombra `AppShadows.bottomBar` hacia arriba.
/// - Padding: 22 arriba y 22 a los lados; el contenido va alineado arriba.
/// - Total: importe 28/800 (amountTotal) y debajo la etiqueta 13/600 text-muted (caption), 1 de separación.
/// - Botón: NidoButton principal de 50 de alto, 34 de padding lateral, sin sombra propia.
/// Va pegada al borde inferior, por ejemplo en un `Stack` con `Positioned(left: 0, right: 0, bottom: 0)`.
class NidoBottomBar extends StatelessWidget {
  const NidoBottomBar({
    super.key,
    required this.total,
    required this.onPressed,
    this.totalLabel = 'Total mensual',
    this.buttonLabel = 'Confirmar',
  });

  /// Importe ya formateado, por ejemplo "S/ 450".
  final String total;
  final VoidCallback? onPressed;
  final String totalLabel;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Container(
      height: 104 + bottomInset,
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.bottomBarTop,
        boxShadow: AppShadows.bottomBar,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(total, style: AppTextStyles.amountTotal),
              const SizedBox(height: 1),
              Text(totalLabel, style: AppTextStyles.caption),
            ],
          ),
          NidoButton(
            label: buttonLabel,
            height: 50,
            expand: false,
            horizontalPadding: 34,
            showShadow: false,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
