import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/components/info_rows.dart';
import 'package:nido_bank/core/components/nido_button.dart';
import 'package:nido_bank/core/components/nido_icons.dart';
import 'package:nido_bank/core/components/nido_illustrations.dart';
import 'package:nido_bank/core/components/nido_motion.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

class UnderReviewScreen extends StatelessWidget {
  const UnderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: AppGradients.review),
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 34),
          child: Column(
            children: [
              SizedBox(
                height: 104,
                child: Center(
                  child: NidoFloat(
                    duration: const Duration(milliseconds: 3600),
                    child: const NidoIllustration(NidoIllustrations.paperPlane, width: 230, height: 104),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text('Lo revisaremos en las próximas 48 horas', textAlign: TextAlign.center, style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'No se trata solo de tu historial crediticio. Normalmente, los prestamistas evalúan estos cuatro factores al decidir sobre tu solicitud.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySm,
                ),
              ),
              const SizedBox(height: 20),
              const NidoTileGrid(
                children: [
                  NidoInfoTile(
                    icon: NidoIcons.calendar,
                    iconColor: AppColors.primary500,
                    iconBackground: AppColors.primary100,
                    title: 'Tu historial crediticio',
                  ),
                  NidoInfoTile(
                    icon: NidoIcons.wallet,
                    iconColor: AppColors.green600,
                    iconBackground: AppColors.green100,
                    title: 'Tus ingresos',
                  ),
                  NidoInfoTile(
                    icon: NidoIcons.coin,
                    iconColor: AppColors.pink600,
                    iconBackground: AppColors.pink100,
                    title: 'Tus ingresos y gastos',
                  ),
                  NidoInfoTile(
                    icon: NidoIcons.shield,
                    iconColor: AppColors.blue600,
                    iconBackground: AppColors.blue100,
                    title: 'Nuestras políticas de crédito',
                  ),
                ],
              ),
              const Spacer(),
              NidoButton(label: 'Entendido', onPressed: () => context.go(AppRoutes.result)),
            ],
          ),
        ),
      ),
    );
  }
}
