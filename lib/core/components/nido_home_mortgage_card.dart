import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_bank.dart';

/// Tarjeta translúcida de hipoteca del Home (la de debajo de la tarjeta blanca).
///
/// Medidas (dp):
/// - Tarjeta: radio 28, fondo blanco al 10% (glass10), borde de 1 en blanco al 20% (glass20), padding 20.
///   En el Home va a 16 de cada lado; en el prototipo empieza a 416 del borde superior.
/// - Separación entre bloques: 14.
/// - Cabecera: avatar del banco de 32 (fondo white, iniciales 12/800 ink900), 10, nombre 15/700 blanco.
/// - Fila inferior (alineada abajo, extremos opuestos): a la izquierda "Saldo" 13/600 (blanco 78%), 2 y el
///   importe 26/800 con tracking -0.52; a la derecha, alineados a la derecha, "Próximo pago · 12 nov"
///   13/600 (blanco 78%), 2 y "S/ 900.00" 18/700.
///
/// En el prototipo NO hay desenfoque: solo el fondo translúcido y el borde. Si quieres cristal esmerilado
/// de verdad, pon [blur] en true (usa BackdropFilter con sigma 12; cuesta rendimiento en gamas bajas).
class NidoHomeMortgageCard extends StatelessWidget {
  const NidoHomeMortgageCard({
    super.key,
    required this.bankInitials,
    required this.bankName,
    required this.balance,
    required this.nextPaymentLabel,
    required this.nextPayment,
    this.balanceLabel = 'Saldo',
    this.blur = false,
  });

  final String bankInitials;
  final String bankName;

  /// Saldo ya formateado, por ejemplo "S/ 418,127".
  final String balance;

  /// Por ejemplo "Próximo pago · 12 nov".
  final String nextPaymentLabel;

  /// Por ejemplo "S/ 900.00".
  final String nextPayment;
  final String balanceLabel;
  final bool blur;

  @override
  Widget build(BuildContext context) {
    final subtle = AppTextStyles.caption.copyWith(color: AppColors.onNightSubtle);

    final card = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.glass10,
        borderRadius: AppRadius.r28,
        border: Border.all(color: AppColors.glass20, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              NidoBankAvatar(initials: bankInitials, size: 32),
              const SizedBox(width: 10),
              Text(
                bankName,
                style: AppTextStyles.rowTitle.copyWith(fontWeight: FontWeight.w700, color: AppColors.white),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(balanceLabel, style: subtle),
                  const SizedBox(height: 2),
                  Text(balance, style: AppTextStyles.amountSm),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(nextPaymentLabel, style: subtle, textAlign: TextAlign.right),
                  const SizedBox(height: 2),
                  Text(
                    nextPayment,
                    style: AppTextStyles.rowTitleLg.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    if (!blur) return card;
    return ClipRRect(
      borderRadius: AppRadius.r28,
      child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), child: card),
    );
  }
}
