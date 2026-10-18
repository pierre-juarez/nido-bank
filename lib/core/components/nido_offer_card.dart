import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Tarjeta de oferta de la pantalla Ofertas.
/// - featured: morada (AppGradients.card, AppShadows.cardBrand), radio 30, padding 20,
///   etiqueta "Mejor tasa" (alto 26, glass20), tasa de 44.
/// - normal: surfaceTint100, radio 30, padding 20, tasa de 34.
/// Separación interna 6 (12 antes del tipo de tasa y de la cuota en la destacada).
class NidoOfferCard extends StatelessWidget {
  const NidoOfferCard({
    super.key,
    required this.type,
    required this.rate,
    required this.payment,
    this.featured = false,
    this.badge = 'Mejor tasa',
  });

  final String type; // "Tasa fija a 5 años"
  final String rate; // "6.9%"
  final String payment; // "Cuota estimada S/ 815 al mes"
  final bool featured;
  final String badge;

  @override
  Widget build(BuildContext context) {
    final typeStyle = AppTextStyles.rowTitle.copyWith(
      fontWeight: FontWeight.w700,
      color: featured ? const Color.fromRGBO(255, 255, 255, 0.9) : AppColors.textMuted,
    );
    final teaStyle = AppTextStyles.caption.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: featured ? AppColors.onPrimaryMuted : AppColors.textMuted,
    );
    final paymentStyle = AppTextStyles.caption.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: featured ? const Color.fromRGBO(255, 255, 255, 0.88) : AppColors.textMuted,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: featured ? AppGradients.card : null,
        color: featured ? null : AppColors.surfaceTint100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: featured ? AppShadows.cardBrand : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (featured) ...[
            Container(
              height: 26,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: AppColors.glass20, borderRadius: BorderRadius.circular(14)),
              child: Center(
                widthFactor: 1,
                child: Text(
                  badge,
                  style: AppTextStyles.chip.copyWith(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          Text(type, style: typeStyle),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(rate, style: featured ? AppTextStyles.rateXl : AppTextStyles.rateMd),
              const SizedBox(width: 8),
              Text('TEA', style: teaStyle),
            ],
          ),
          SizedBox(height: featured ? 12 : 6),
          Text(payment, style: paymentStyle),
        ],
      ),
    );
  }
}

/// Estado vacío de Ofertas: círculo de 84 en primary50 con un aro de 40 y borde 5 en primary500.
/// Título 26/800 y texto body, separación 12.
class NidoEmptyState extends StatelessWidget {
  const NidoEmptyState({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 84,
            height: 84,
            alignment: Alignment.center,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary50),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary500, width: 5),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.stateTitle.copyWith(fontSize: 26, height: 1.2, letterSpacing: -0.035 * 26),
          ),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
