import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/core/theme/app_theme.dart';
import 'package:nido_bank/features/onboarding/presentation/onboarding_pages.dart';
import 'package:nido_bank/features/onboarding/presentation/onboarding_page_data.dart';

/// Onboarding de tres páginas con deslizamiento horizontal.
///
/// Estructura: el panel degradado (470 de alto, radio inferior 44) queda fijo detrás y el `PageView`
/// desliza la ilustración y el texto. "Saltar" y el bloque inferior (puntos + botón) también son fijos.
/// Medidas: ilustración centrada en los 470 del panel con círculo translúcido de 280; título a 32 del panel;
/// título 34/800; párrafo a 12 del título con margen lateral 36 (28 + 8); puntos a 24 del botón;
/// botón de 56 a 34 del borde inferior y 28 a los lados; "Saltar" a 64 arriba y 20 a la derecha.
/// Nota: en el prototipo los puntos iban a 22 bajo el párrafo; aquí van sobre el botón para que no se muevan.
class NidoOnboardingScreen extends StatefulWidget {
  const NidoOnboardingScreen({
    super.key,
    required this.onFinished,
    this.pages = nidoOnboardingPages,
  });

  /// Se llama con "Saltar" y con "Empezar" de la última página.
  final VoidCallback onFinished;
  final List<NidoOnboardingPageData> pages;

  @override
  State<NidoOnboardingScreen> createState() => _NidoOnboardingScreenState();
}

class _NidoOnboardingScreenState extends State<NidoOnboardingScreen> {
  static const _heroHeight = 470.0;

  final _controller = PageController();
  int _index = 0;

  bool get _isLast => _index == widget.pages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_isLast) {
      widget.onFinished();
    } else {
      _controller.nextPage(duration: const Duration(milliseconds: 320), curve: Curves.easeOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            // Panel fijo con degradado y círculo translúcido.
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NidoGradientBackground(
                height: _heroHeight,
                gradient: AppGradients.onboarding,
                borderRadius: AppRadius.onboardingHeroBottom,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.12), shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
            // Páginas que se deslizan.
            PageView.builder(
              controller: _controller,
              itemCount: widget.pages.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) => _Page(data: widget.pages[i], heroHeight: _heroHeight),
            ),
            // Saltar.
            Positioned(
              top: 64,
              right: 20,
              child: NidoChip(
                label: 'Saltar',
                height: 36,
                horizontalPadding: 16,
                background: AppColors.glass20,
                foreground: AppColors.white,
                onPressed: widget.onFinished,
              ),
            ),
            // Puntos y botón.
            Positioned(
              left: 28,
              right: 28,
              bottom: 34,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NidoPageDots(count: widget.pages.length, index: _index),
                  const SizedBox(height: 24),
                  NidoButton(label: _isLast ? 'Empezar' : 'Siguiente', onPressed: _next),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.data, required this.heroHeight});

  final NidoOnboardingPageData data;
  final double heroHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heroHeight,
          child: Center(
            child: NidoFloat(
              duration: data.floatDuration,
              child: NidoIllustration(
                data.illustration,
                width: data.illustrationWidth,
                height: data.illustrationHeight,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(data.title, textAlign: TextAlign.center, style: AppTextStyles.onboardingTitle),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(data.body, textAlign: TextAlign.center, style: AppTextStyles.body),
        ),
      ],
    );
  }
}
