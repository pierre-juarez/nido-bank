import 'package:flutter/material.dart';

import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/features/splash/presentation/screens/android_splash_screen.dart';
import 'package:nido_bank/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:nido_bank/features/splash/presentation/screens/splash_screen.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

/// Pantalla de prueba que reúne todos los componentes con datos de ejemplo.
class ComponentsGallery extends StatefulWidget {
  const ComponentsGallery({super.key});

  @override
  State<ComponentsGallery> createState() => _ComponentsGalleryState();
}

class _ComponentsGalleryState extends State<ComponentsGallery> {
  int _tab = 0;
  double _percent = 50;

  static const _tabs = [
    NidoTabItem(label: 'Principal', icon: NidoIcons.home),
    NidoTabItem(label: 'Gestionar', icon: NidoIcons.sliders),
    NidoTabItem(label: 'Pedir', icon: NidoIcons.borrow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _Section(
              'Splash de Android (continúa al nativo)',
              NidoButton(
                label: 'Splash Android',
                variant: NidoButtonVariant.soft,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (ctx) => NidoAndroidSplashScreen(onFinished: () => Navigator.of(ctx).pop()),
                )),
              ),
            ),
            _Section(
              'Pantallas de arranque',
              Row(
                children: [
                  Expanded(
                    child: NidoButton(
                      label: 'Splash',
                      variant: NidoButtonVariant.soft,
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (ctx) => NidoSplashScreen(onFinished: () => Navigator.of(ctx).pop()),
                      )),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: NidoButton(
                      label: 'Onboarding',
                      variant: NidoButtonVariant.soft,
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (ctx) => NidoOnboardingScreen(onFinished: () => Navigator.of(ctx).pop()),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            _Section(
              'Marca, barra de progreso y puntos',
              _Dark(
                Column(
                  children: [
                    const NidoLogoTile(),
                    const SizedBox(height: 20),
                    const NidoProgressBar(value: 0.6),
                    const SizedBox(height: 20),
                    const NidoPageDots(count: 3, index: 1, inactiveColor: AppColors.glass20, activeColor: AppColors.white),
                  ],
                ),
              ),
            ),
            _Section(
              'Botón principal (56)',
              NidoButton(label: 'Buscar mi hipoteca', onPressed: () {}),
            ),
            _Section(
              'Botón suave (48)',
              NidoButton(
                label: 'Ver progreso en el tiempo',
                variant: NidoButtonVariant.soft,
                height: 48,
                onPressed: () {},
              ),
            ),
            _Section(
              'Botón claro (50) y chip (30) sobre fondo oscuro',
              _Dark(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NidoButton(label: 'Editar detalles', variant: NidoButtonVariant.light, onPressed: () {}),
                    const SizedBox(height: 12),
                    NidoChip(label: 'Eliminar', showCloseIcon: true, onPressed: () {}),
                  ],
                ),
              ),
            ),
            _Section(
              'Barra de navegación (288 × 64)',
              _Dark(
                Center(
                  child: NidoTabBar(
                    items: _tabs,
                    currentIndex: _tab,
                    onTap: (i) => setState(() => _tab = i),
                  ),
                ),
              ),
            ),
            _Section(
              'Tarjeta de hipoteca',
              NidoMortgageCard(
                bankInitials: 'BA',
                bankName: 'Banco Andino',
                balance: 'S/ 418,127',
                lastReported: '02 jun 2026',
                monthlyPayment: 'S/ 900.00',
                shareLabel: '${_percent.round()}%',
                onDelete: () {},
                onEdit: () async {
                  final result = await showNidoEditPaymentSheet(
                    context,
                    initialPercent: _percent,
                    bankInitials: 'BA',
                    bankName: 'Banco Andino',
                  );
                  if (result != null) setState(() => _percent = result);
                },
              ),
            ),
            _Section(
              'Filas informativas (separación 12)',
              Column(
                children: const [
                  NidoInfoRow(
                    icon: NidoIcons.search,
                    iconColor: AppColors.primary500,
                    iconBackground: AppColors.primary100,
                    title: 'Traemos tus datos',
                    subtitle: 'Desde tu central de riesgo',
                  ),
                  SizedBox(height: 12),
                  NidoInfoRow(
                    icon: NidoIcons.sliders,
                    iconColor: AppColors.pink600,
                    iconBackground: AppColors.pink100,
                    title: 'Ajustas tu parte del pago',
                    subtitle: 'Útil si la compartes con alguien',
                  ),
                  SizedBox(height: 12),
                  NidoInfoRow(
                    icon: NidoIcons.clock,
                    iconColor: AppColors.green600,
                    iconBackground: AppColors.green100,
                    title: 'Recibes ofertas en 48 horas',
                    subtitle: 'Revisamos tu solicitud por ti',
                  ),
                ],
              ),
            ),
            const _Section(
              'Mosaicos 2 × 2 (separación 10)',
              NidoTileGrid(
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
            ),
            _Section(
              'Control "Tu parte"',
              NidoShareSlider(percent: _percent, onChanged: (v) => setState(() => _percent = v)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section(this.title, this.child);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.captionStrong),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _Dark extends StatelessWidget {
  const _Dark(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: const BoxDecoration(gradient: AppGradients.manage, borderRadius: AppRadius.r28),
      child: child,
    );
  }
}
