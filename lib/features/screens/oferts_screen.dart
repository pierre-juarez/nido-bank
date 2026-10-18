import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

class OfertsScreen extends StatelessWidget {
  const OfertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 68, 20, 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tus ofertas', style: AppTextStyles.pageTitle),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  'Estas ofertas parten de tu hipoteca actual y tu perfil. Son referenciales hasta que las confirmemos contigo.',
                  style: AppTextStyles.bodySm,
                ),
              ),
              const SizedBox(height: 18),
              const NidoOfferCard(
                featured: true,
                type: 'Tasa fija a 5 años',
                rate: '6.9%',
                payment: 'Cuota estimada S/ 815 al mes',
              ),
              const SizedBox(height: 12),
              const NidoOfferCard(type: 'Tasa fija a 2 años', rate: '7.4%', payment: 'Cuota estimada S/ 842 al mes'),
              const Spacer(),
              NidoButton(label: 'Volver al inicio', height: 56, onPressed: () => context.go(AppRoutes.home)),
            ],
          ),
        ),
      ),
    );
  }
}
