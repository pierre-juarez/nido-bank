import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nido_bank.dart';
import 'nido_button.dart';
import 'share_slider.dart';

/// Abre la hoja de edición del pago y devuelve el porcentaje elegido al pulsar "Listo"
/// (null si se cierra tocando el velo).
Future<double?> showNidoEditPaymentSheet(
  BuildContext context, {
  required double initialPercent,
  required String bankInitials,
  required String bankName,
  double monthlyAmount = 900,
}) {
  return showModalBottomSheet<double>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    barrierColor: AppColors.scrim,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheetTop),
    builder: (_) => NidoEditPaymentSheet(
      initialPercent: initialPercent,
      bankInitials: bankInitials,
      bankName: bankName,
      monthlyAmount: monthlyAmount,
    ),
  );
}

/// Contenido de la hoja. Medidas, de arriba abajo:
/// padding 14 arriba y 20 a los lados; asa 40 × 5 (radio 3); 18; cápsula del banco (36); 16;
/// etiqueta + importe + control + extremos (NidoShareSlider); 16; ayuda 13/1.45 centrada con
/// 6 de margen lateral; 16; botón "Listo" de 54; 16 más el área segura inferior.
/// La fila de teclado del prototipo era un adorno: la real es el teclado del sistema.
class NidoEditPaymentSheet extends StatefulWidget {
  const NidoEditPaymentSheet({
    super.key,
    required this.initialPercent,
    required this.bankInitials,
    required this.bankName,
    this.monthlyAmount = 900,
  });

  final double initialPercent;
  final String bankInitials;
  final String bankName;
  final double monthlyAmount;

  @override
  State<NidoEditPaymentSheet> createState() => _NidoEditPaymentSheetState();
}

class _NidoEditPaymentSheetState extends State<NidoEditPaymentSheet> {
  late double _percent = widget.initialPercent;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 14, 20, 16 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(color: AppColors.handle, borderRadius: BorderRadius.circular(3)),
          ),
          const SizedBox(height: 18),
          NidoBankChip(initials: widget.bankInitials, name: widget.bankName),
          const SizedBox(height: 16),
          NidoShareSlider(
            percent: _percent,
            monthlyAmount: widget.monthlyAmount,
            onChanged: (v) => setState(() => _percent = v),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              'Si divides este pago con otra persona, edita los detalles para indicar tu parte.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyXs,
            ),
          ),
          const SizedBox(height: 16),
          NidoButton(
            label: 'Listo',
            height: 54,
            onPressed: () => Navigator.of(context).pop(_percent),
          ),
        ],
      ),
    );
  }
}
