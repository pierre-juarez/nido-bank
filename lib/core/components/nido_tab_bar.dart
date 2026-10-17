import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_icons.dart';

class NidoTabItem {
  const NidoTabItem({required this.label, required this.icon});

  final String label;

  /// Un valor de [NidoIcons], por ejemplo NidoIcons.home.
  final String icon;
}

/// Barra de navegación flotante: píldora oscura de 288 × 64.
///
/// Medidas: radio 32, fondo ink950, padding 6. Cada ítem mide 86 × 52 con radio 26,
/// icono de 20, separación 3 y etiqueta 11/700. Activo: fondo glass20 al 16% (glass16) y
/// texto blanco; inactivo: blanco al 66%. Reparte los tres ítems con space-between.
class NidoTabBar extends StatelessWidget {
  const NidoTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<NidoTabItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _inactive = Color.fromRGBO(255, 255, 255, 0.66);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.ink950,
      borderRadius: BorderRadius.circular(32),
      child: SizedBox(
        width: AppSize.navWidth,
        height: AppSize.navHeight,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < items.length; i++)
                _TabButton(
                  item: items[i],
                  active: i == currentIndex,
                  onTap: () => onTap(i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({required this.item, required this.active, required this.onTap});

  final NidoTabItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = active ? AppColors.white : NidoTabBar._inactive;
    final radius = BorderRadius.circular(26);
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: AppSize.navItemWidth,
        height: AppSize.navItemHeight,
        decoration: BoxDecoration(
          color: active ? AppColors.glass16 : Colors.transparent,
          borderRadius: radius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NidoIcon(item.icon, size: 20, color: fg),
            const SizedBox(height: 3),
            Text(item.label, style: AppTextStyles.navLabel.copyWith(color: fg)),
          ],
        ),
      ),
    );
  }
}

/// Coloca la barra centrada y a 28 del borde inferior, como en el diseño.
/// Úsala dentro de un Stack (o en Scaffold con extendBody) por encima del contenido,
/// y deja al menos 108 de relleno inferior en el contenido que se desplaza.
class NidoFloatingTabBar extends StatelessWidget {
  const NidoFloatingTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<NidoTabItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.navBottom),
        child: NidoTabBar(items: items, currentIndex: currentIndex, onTap: onTap),
      ),
    );
  }
}
