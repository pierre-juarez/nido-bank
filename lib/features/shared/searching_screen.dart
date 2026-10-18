import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nido_bank/core/components/nido_button.dart';
import 'package:nido_bank/core/components/nido_search_loder.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

/// Pantalla "Buscando tu hipoteca": loader animado, título y subtítulo, con "Saltar" arriba a la derecha.
///
/// Medidas (dp): fondo white; columna centrada con padding lateral 40; loader 200 x 200, 26, título
/// (stateTitle, 30/800), 8, subtítulo (body, 15, interlineado 1.45). "Saltar": NidoChip de 36 de alto,
/// padding lateral 16, fondo surfaceChip, a 64 del borde superior y 20 del derecho.
/// Pasa sola a la siguiente pantalla a los 1.6 s llamando a [onFinished]; "Saltar" la adelanta.
class SearchingScreen extends StatefulWidget {
  const SearchingScreen({
    super.key,
    required this.onFinished,
    this.duration = const Duration(milliseconds: 1600),
    this.title = 'Buscando tu hipoteca',
    this.subtitle = 'Esto toma solo unos segundos.',
  });

  final VoidCallback onFinished;
  final Duration duration;
  final String title;
  final String subtitle;

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  Timer? _timer;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, _finish);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _finish() {
    if (_done || !mounted) return;
    _done = true;
    _timer?.cancel();
    widget.onFinished();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const NidoSearchLoader(),
                  const SizedBox(height: 26),
                  Text(widget.title, textAlign: TextAlign.center, style: AppTextStyles.stateTitle),
                  const SizedBox(height: 8),
                  Text(widget.subtitle, textAlign: TextAlign.center, style: AppTextStyles.body.copyWith(height: 1.45)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 64,
            right: 20,
            child: NidoChip(
              label: 'Saltar',
              height: 36,
              horizontalPadding: 16,
              background: AppColors.surfaceChip,
              foreground: AppColors.ink900,
              onPressed: _finish,
            ),
          ),
        ],
      ),
    );
  }
}
