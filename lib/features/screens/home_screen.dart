import 'package:flutter/material.dart';
import 'package:nido_bank/core/components/nido_home_mortgage_card.dart';
import 'package:nido_bank/core/components/nido_home_value_card.dart';
import 'package:nido_bank/core/theme/app_theme.dart';
import 'package:nido_bank/features/shell/presentation/screens/main_shell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        spacing: AppSpacing.s24,
        children: [
          NidoHomeValueCard(
            value: 'S/ 590 000',
            ltv: '71%',
            description:
                'Llegarás a la banda del 70% antes de que termine tu tasa actual. Estar en una banda menor suele significar tasas más bajas.',
            onButtonPressed: () {},
          ),
          NidoHomeMortgageCard(
            bankInitials: 'BA',
            bankName: 'Banco Andino',
            balance: 'S/ 418,127',
            nextPaymentLabel: 'Próximo pago · 12 nov',
            nextPayment: 'S/ 900.00',
          ),
        ],
      ),
    );
  }
}
