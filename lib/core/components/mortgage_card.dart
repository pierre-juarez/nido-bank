import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_bank.dart';
import 'nido_button.dart';

/// Tarjeta morada con el resumen de la hipoteca encontrada.
///
/// Medidas: radio 30, padding 16, gradiente card, sombra cardBrand. Separación vertical 12 entre
/// bloques. Fila superior: avatar de 34, 10 de separación, nombre 15/700, chip "Eliminar" de 30 de alto.
/// Saldo: etiqueta 13/600 y cifra 30/800 con 2 de separación, en un bloque con padding 4 arriba y 2 a los lados.
/// Mosaicos: dos [Expanded] con 10 de separación, radio 18, padding 12, fondo glass16;
/// etiqueta 12/700 y valor 19/800 con 4 de separación. Botón "Editar detalles": alto 50, blanco.
class NidoMortgageCard extends StatelessWidget {
  const NidoMortgageCard({
    super.key,
    required this.bankInitials,
    required this.bankName,
    required this.balance,
    required this.lastReported,
    required this.monthlyPayment,
    required this.shareLabel,
    this.onDelete,
    this.onEdit,
  });

  final String bankInitials;
  final String bankName;

  /// Ejemplo: "S/ 418,127".
  final String balance;

  /// Ejemplo: "02 jun 2026".
  final String lastReported;

  /// Pago mensual completo. Ejemplo: "S/ 900.00".
  final String monthlyPayment;

  /// Parte de la persona. Ejemplo: "100%".
  final String shareLabel;

  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final onPrimaryCaption = AppTextStyles.caption.copyWith(color: AppColors.onPrimaryMuted);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppGradients.card,
        borderRadius: AppRadius.r30,
        boxShadow: AppShadows.cardBrand,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NidoBankAvatar(initials: bankInitials),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  bankName,
                  style: AppTextStyles.rowTitle.copyWith(fontWeight: FontWeight.w700, color: AppColors.white),
                ),
              ),
              NidoChip(label: 'Eliminar', onPressed: onDelete, showCloseIcon: true),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 4, 2, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Saldo', style: onPrimaryCaption),
                const SizedBox(height: 2),
                Text(balance, style: AppTextStyles.amountMd.copyWith(color: AppColors.white)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text('Último reporte: $lastReported', style: onPrimaryCaption),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _Tile(label: 'Pago mensual', value: monthlyPayment)),
              const SizedBox(width: 10),
              Expanded(child: _Tile(label: 'Tu parte', value: shareLabel)),
            ],
          ),
          const SizedBox(height: 12),
          NidoButton(
            label: 'Editar detalles',
            variant: NidoButtonVariant.light,
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: AppColors.glass16, borderRadius: AppRadius.r18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onPrimaryMuted)),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.amountSm.copyWith(fontSize: 19, letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
