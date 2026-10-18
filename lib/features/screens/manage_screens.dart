import 'package:flutter/material.dart';
import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/components/nido_payment_row.dart';
import 'package:nido_bank/core/components/nido_promo_card.dart';
import 'package:nido_bank/core/components/nido_stat_tile.dart';
import 'package:nido_bank/core/theme/app_theme.dart';
import 'package:nido_bank/features/shell/presentation/screens/main_shell.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.s24,
        left: AppSpacing.s16,
        right: AppSpacing.s16,
        bottom: MainShell.contentBottomInset,
      ),
      child: Column(
        spacing: AppSpacing.s12,
        children: [
          NidoButton(label: 'Ver todos los pagos', variant: NidoButtonVariant.light, onPressed: () {}),
          NidoStatTilePair(
            left: const NidoStatTile(
              icon: NidoIcons.wallet,
              iconColor: AppColors.red600,
              iconBackground: AppColors.red100,
              label: 'Documentos\nguardados',
              value: '10',
            ),
            right: const NidoStatTile(
              icon: NidoIcons.wallet,
              iconColor: AppColors.green600,
              iconBackground: AppColors.green100,
              label: 'Fecha de pago regular',
              value: '12',
              suffix: 'de cada mes',
            ),
          ),
          NidoPaymentRow(
            title: 'Hacer un pago',
            subtitle: 'Adelanta dinero a tu hipoteca',
            onTap: () {},
            leadingLabel: 'S/',
          ),
          NidoPromoCard(
            title: 'Pide una nueva hipoteca',
            subtitle: 'Hasta S/ 300 000 para una casa nueva',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
