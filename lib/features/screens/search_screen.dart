import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fondo blanco: iconos de la barra de estado oscuros.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
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
                Text('Encontremos\ntu hipoteca', textAlign: TextAlign.center, style: AppTextStyles.screenTitle),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Traemos los datos de tu hipoteca actual para que no tengas que escribirlos. Tú revisas y confirmas.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body,
                  ),
                ),
                SizedBox(height: AppSpacing.s24),
                const NidoInfoRow(
                  icon: NidoIcons.search,
                  iconColor: AppColors.primary500,
                  iconBackground: AppColors.primary100,
                  title: 'Traemos tus datos',
                  subtitle: 'Desde tu central de riesgo',
                ),
                const NidoInfoRow(
                  icon: NidoIcons.sliders,
                  iconColor: AppColors.pink600,
                  iconBackground: AppColors.pink100,
                  title: 'Ajustas tu parte del pago',
                  subtitle: 'Útil si la compartes con alguien',
                ),
                const NidoInfoRow(
                  icon: NidoIcons.clock,
                  iconColor: AppColors.green600,
                  iconBackground: AppColors.green100,
                  title: 'Recibes ofertas en 48 horas',
                  subtitle: 'Revisamos tu solicitud por ti',
                ),
                Spacer(),
                NidoButton(
                  label: 'Buscar mi hipoteca',
                  variant: NidoButtonVariant.primary,
                  onPressed: () => context.go(AppRoutes.searching),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
