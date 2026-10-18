import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nido_bank/core/components/nido_backdrop.dart';
import 'package:nido_bank/core/components/nido_icons.dart';
import 'package:nido_bank/core/components/nido_tab_bar.dart';
import 'package:nido_bank/core/router/app_routes.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

/// Contenedor de las pestañas: dibuja el fondo y la barra una sola vez y solo cambia el contenido.
/// Fondos: Principal usa `AppGradients.home` con resplandor; Gestionar usa `AppGradients.manage`,
/// y pasan de uno a otro con un fundido.
class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _tabs = [
    NidoTabItem(label: 'Principal', icon: NidoIcons.home),
    NidoTabItem(label: 'Gestionar', icon: NidoIcons.sliders),
    NidoTabItem(label: 'Pedir', icon: NidoIcons.borrow),
  ];

  static const manageIndex = 1;
  static const searchIndex = 2;

  /// Espacio que el contenido debe dejar abajo para no quedar tapado por la barra.
  static const contentBottomInset = AppSize.navHeight + AppSpacing.s14 + AppSpacing.s12;

  @override
  Widget build(BuildContext context) {
    final index = navigationShell.currentIndex;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const NidoGradientBackground(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: index == manageIndex ? 1 : 0,
              child: const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.manage)),
            ),
            SafeArea(
              child: Stack(
                children: [
                  navigationShell,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.s14),
                      child: NidoTabBar(
                        items: _tabs,
                        currentIndex: index,
                        onTap: (i) {
                          // Pedir abre una pantalla completa por encima del shell, sin barra.
                          if (i == searchIndex) {
                            context.push(AppRoutes.search);
                            return;
                          }
                          navigationShell.goBranch(i, initialLocation: i == index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
