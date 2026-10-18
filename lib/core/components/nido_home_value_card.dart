import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_button.dart';
import 'nido_illustrations.dart';
import 'nido_motion.dart';

/// Tarjeta blanca de valor del Home ("Valor de tu casa").
///
/// Medidas (dp):
/// - Tarjeta: radio 32, fondo white95, sombra cardHome, padding 22 / 22 / 22 / 18 (izq, arriba, der, abajo).
///   En el Home va a 16 de cada lado y a 64 del borde superior (la posición la pone quien la use).
/// - Separación entre bloques: 14.
/// - Cabecera: etiqueta 14/600 (labelMd), 6, importe 32/800 (amountLg); la columna lleva 6 de padding arriba.
///   A la derecha, la casita de 132 x 106 flotando (4 s), 14 por encima del borde superior y 6 hacia afuera
///   por la derecha; la cabecera mide 92 de alto.
/// - Fila LTV: "71%" 30/800 con tracking -0.6, 8, texto 15/600 text-muted, alineados por la línea base.
/// - Párrafo: 14 con interlineado 1.45, text-muted.
/// - Botón suave de 48 de alto.
class NidoHomeValueCard extends StatelessWidget {
  const NidoHomeValueCard({
    super.key,
    required this.value,
    required this.ltv,
    required this.description,
    required this.onButtonPressed,
    this.valueLabel = 'Valor de tu casa',
    this.ltvCaption = 'préstamo / valor (LTV)',
    this.buttonLabel = 'Ver progreso en el tiempo',
  });

  /// Importe ya formateado, por ejemplo "S/ 590 000".
  final String value;

  /// Porcentaje ya formateado, por ejemplo "71%".
  final String ltv;
  final String description;
  final VoidCallback? onButtonPressed;
  final String valueLabel;
  final String ltvCaption;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
      decoration: const BoxDecoration(color: AppColors.white95, borderRadius: AppRadius.r32, boxShadow: AppShadows.cardHome),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 92,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(valueLabel, style: AppTextStyles.labelMd),
                        const SizedBox(height: 6),
                        Text(value, style: AppTextStyles.amountLg),
                      ],
                    ),
                  ),
                ),
                // La casita sobresale 14 por arriba y 6 por la derecha.
                SizedBox(
                  width: 126,
                  height: 92,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -14,
                        left: 0,
                        child: NidoFloat(
                          duration: const Duration(milliseconds: 4000),
                          child: const NidoIllustration(NidoIllustrations.house, width: 132, height: 106),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(ltv, style: AppTextStyles.amountMd.copyWith(color: AppColors.ink900, letterSpacing: -0.6)),
              const SizedBox(width: 8),
              Flexible(child: Text(ltvCaption, style: AppTextStyles.labelMd.copyWith(fontSize: 15))),
            ],
          ),
          const SizedBox(height: 14),
          Text(description, style: AppTextStyles.bodySm.copyWith(height: 1.45)),
          const SizedBox(height: 14),
          NidoButton(label: buttonLabel, variant: NidoButtonVariant.soft, height: 48, onPressed: onButtonPressed),
        ],
      ),
    );
  }
}
