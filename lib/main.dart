import 'package:flutter/material.dart';
import 'package:nido_bank/core/router/app_router.dart';
import 'package:nido_bank/core/theme/app_theme.dart';

void main() => runApp(const NidoApp());

class NidoApp extends StatelessWidget {
  const NidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'nido',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
