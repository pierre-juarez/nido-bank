import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nido_bank/core/router/app_router.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => const NidoApp(),
    ),
  );
}

class NidoApp extends StatelessWidget {
  const NidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'nido',
      theme: AppTheme.light,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: appRouter,
    );
  }
}
