import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/components/nido_bottom_bar.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

class FoundScreen extends StatefulWidget {
  const FoundScreen({super.key});

  @override
  State<FoundScreen> createState() => _FoundScreenState();
}

class _FoundScreenState extends State<FoundScreen> {
  static const _monthlyAmount = 900.0;

  double _percent = 50;

  /// Tu parte del pago mensual: el mismo cálculo que muestra la hoja de edición.
  String get _total => 'S/ ${(_monthlyAmount * _percent / 100).toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    // Fondo blanco: iconos de la barra de estado oscuros.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSpacing.s8,
                  left: AppSpacing.s16,
                  right: AppSpacing.s16,
                  bottom: AppSpacing.s14,
                ),
                child: Column(
                  spacing: AppSpacing.s12,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        color: AppColors.surfaceChip,
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => context.pop(),
                          customBorder: const CircleBorder(),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(child: NidoIcon(NidoIcons.close, size: 16, strokeWidth: 2.5, color: AppColors.ink900)),
                          ),
                        ),
                      ),
                    ),

                    Text('Encontramos\ntu hipoteca 👀', textAlign: TextAlign.center, style: AppTextStyles.screenTitle),
                    SizedBox(height: AppSpacing.s2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Traemos los datos de tu hipoteca actual para que no tengas que escribirlos. Tú revisas y confirmas.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body,
                      ),
                    ),
                    SizedBox(height: AppSpacing.s14),
                    NidoMortgageCard(
                      bankInitials: 'BA',
                      bankName: 'Banco Andino',
                      balance: 'S/ 418,127',
                      lastReported: '02 jun 2026',
                      monthlyPayment: 'S/ ${_monthlyAmount.toStringAsFixed(2)}',
                      shareLabel: '${_percent.round()}%',
                      onDelete: () {},
                      onEdit: () async {
                        final result = await showNidoEditPaymentSheet(
                          context,
                          initialPercent: _percent,
                          bankInitials: 'BA',
                          bankName: 'Banco Andino',
                          monthlyAmount: _monthlyAmount,
                        );
                        if (result != null) setState(() => _percent = result);
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: NidoBottomBar(total: _total, onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
