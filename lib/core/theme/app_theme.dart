// Tokens de Nido para Flutter, extraídos del prototipo (lienzo de 390 × 844).
// Las medidas están en píxeles lógicos (dp): mismas cifras que el prototipo.
// Dependencias en pubspec.yaml: google_fonts, flutter_svg.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppColors {
  // Primarios
  static const primary600 = Color(0xFF4A35F0);
  static const primary500 = Color(0xFF5B3DF5);
  static const primary400 = Color(0xFF6A4DFF);
  static const primary350 = Color(0xFF6D4EFF);
  static const primary300 = Color(0xFF7A5CFF);
  static const primary100 = Color(0xFFE6E1FF);
  static const primary50 = Color(0xFFEEEBFF);

  // Tinta y texto
  static const ink900 = Color(0xFF17104A);
  static const ink950 = Color(0xFF0E0B24);
  static const textMuted = Color(0xFF5E5B7D);
  static const textPlaceholder = Color(0xFF6B6A85);
  static const white = Color(0xFFFFFFFF);

  // Superficies claras
  static const surfaceTint50 = Color(0xFFF6F5FD);
  static const surfaceTint100 = Color(0xFFF4F3FC);
  static const surfaceChip = Color(0xFFF0EEFA);
  static const surfaceSoftButton = Color(0xFFEEEDF8);
  static const borderSoft = Color(0xFFE4E2F2);
  static const track = Color(0xFFE4E2F5);
  static const handle = Color(0xFFDAD8EA);

  // Fondos oscuros y cielo
  static const night900 = Color(0xFF1A1260);
  static const night800 = Color(0xFF241A78);
  static const night700 = Color(0xFF2A1C86);
  static const night600 = Color(0xFF3424A8);
  static const night500 = Color(0xFF4A35C4);
  static const night300 = Color(0xFF9A78F2);
  static const glowYellow = Color(0xFFFFE7A6);
  static const sky300 = Color(0xFFA9C8F2);
  static const sky100 = Color(0xFFDDE9FB);

  // Translúcidos
  static const onPrimaryMuted = Color.fromRGBO(255, 255, 255, 0.85); // sube a 0.92 si necesitas 4.5:1
  static const onNightMuted = Color.fromRGBO(255, 255, 255, 0.82);
  static const onNightSubtle = Color.fromRGBO(255, 255, 255, 0.78);
  static const white95 = Color.fromRGBO(255, 255, 255, 0.95);
  static const white92 = Color.fromRGBO(255, 255, 255, 0.92);
  static const glass10 = Color.fromRGBO(255, 255, 255, 0.10);
  static const glass16 = Color.fromRGBO(255, 255, 255, 0.16);
  static const glass20 = Color.fromRGBO(255, 255, 255, 0.20);
  static const scrim = Color.fromRGBO(20, 14, 60, 0.58);

  // Pares de icono (fondo / trazo)
  static const pink100 = Color(0xFFFFE0F1);
  static const pink600 = Color(0xFFD6409F);
  static const green100 = Color(0xFFD9F5E6);
  static const green600 = Color(0xFF1F8F5A);
  static const blue100 = Color(0xFFDCE6FF);
  static const blue600 = Color(0xFF2D5BE3);
  static const red100 = Color(0xFFFFE0E0);
  static const red600 = Color(0xFFD6403F);

  // Esfera (orb)
  static const coral300 = Color(0xFFFFB59A);
  static const coral500 = Color(0xFFF0526F);
  static const magenta600 = Color(0xFFC42E7C);
}

abstract final class AppSpacing {
  static const s8 = 8.0;
  static const s10 = 10.0;
  static const s12 = 12.0;
  static const s14 = 14.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;
  static const insetTop = 64.0; // además del SafeArea
  static const insetBottom = 34.0;
  static const navBottom = 28.0;
}

abstract final class AppRadius {
  static const r12 = BorderRadius.all(Radius.circular(12));
  static const r18 = BorderRadius.all(Radius.circular(18));
  static const r22 = BorderRadius.all(Radius.circular(22));
  static const r26 = BorderRadius.all(Radius.circular(26));
  static const r28 = BorderRadius.all(Radius.circular(28));
  static const r30 = BorderRadius.all(Radius.circular(30));
  static const r32 = BorderRadius.all(Radius.circular(32));
  static const sheetTop = BorderRadius.vertical(top: Radius.circular(36));
  static const bottomBarTop = BorderRadius.vertical(top: Radius.circular(28));
  static const pill = StadiumBorder();
  /// Panel superior del onboarding: radio inferior 44.
  static const onboardingHeroBottom = BorderRadius.vertical(bottom: Radius.circular(44));
}

abstract final class AppSize {
  static const screenWidth = 390.0;
  static const screenHeight = 844.0;
  static const ctaHeight = 56.0;
  static const buttonHeight = 50.0;
  static const inputHeight = 46.0;
  static const navWidth = 288.0;
  static const navHeight = 64.0;
  static const navItemWidth = 86.0;
  static const navItemHeight = 52.0;
  static const iconTile = 40.0;
  static const bankAvatar = 34.0;
  static const sliderThumb = 24.0;
  static const sliderTrack = 10.0;
  static const bottomBar = 104.0;
}

abstract final class AppShadows {
  static const cta = [
    BoxShadow(color: Color.fromRGBO(74, 53, 240, 0.7), offset: Offset(0, 14), blurRadius: 28, spreadRadius: -12),
  ];
  static const cardBrand = [
    BoxShadow(color: Color.fromRGBO(74, 53, 240, 0.7), offset: Offset(0, 22), blurRadius: 40, spreadRadius: -22),
  ];
  static const cardHome = [
    BoxShadow(color: Color.fromRGBO(26, 18, 96, 0.5), offset: Offset(0, 22), blurRadius: 44, spreadRadius: -18),
  ];
  static const bottomBar = [
    BoxShadow(color: Color.fromRGBO(26, 18, 96, 0.3), offset: Offset(0, -12), blurRadius: 30, spreadRadius: -14),
  ];
  static const thumb = [
    BoxShadow(color: Color.fromRGBO(40, 25, 140, 0.35), offset: Offset(0, 2), blurRadius: 8),
  ];
}

/// Ángulos CSS convertidos a Alignment: 150deg → (-0.5,-0.866) a (0.5,0.866);
/// 160deg → (-0.342,-0.94) a (0.342,0.94). Es una aproximación del gradiente CSS.
abstract final class AppGradients {
  static const cta = LinearGradient(
    begin: Alignment(-0.5, -0.866),
    end: Alignment(0.5, 0.866),
    colors: [AppColors.primary400, AppColors.primary600],
  );
  static const card = LinearGradient(
    begin: Alignment(-0.342, -0.94),
    end: Alignment(0.342, 0.94),
    colors: [AppColors.primary600, AppColors.primary350],
  );
  static const brand = LinearGradient(
    begin: Alignment(-0.5, -0.866),
    end: Alignment(0.5, 0.866),
    colors: [AppColors.primary300, AppColors.primary600],
  );
  static const slider = LinearGradient(
    colors: [AppColors.primary600, AppColors.primary300],
  );
  static const manage = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.night600, AppColors.night800, AppColors.night900],
    stops: [0, 0.46, 1],
  );
  static const home = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.night300, AppColors.night500, AppColors.night700, AppColors.night900],
    stops: [0, 0.34, 0.62, 1],
  );
  /// Panel superior del onboarding: 3 paradas, hasta night700.
  static const onboarding = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.night300, AppColors.night500, AppColors.night700],
    stops: [0, 0.55, 1],
  );
  // Resplandor cálido de Inicio: ponlo en una capa encima de `home`, anclado arriba.
  static const homeGlow = RadialGradient(
    center: Alignment(0, -1),
    radius: 1.0,
    colors: [AppColors.glowYellow, Color(0x00FFE7A6)],
    stops: [0, 0.72],
  );
  static const result = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.night700, AppColors.night900],
  );
  // Resplandor inferior de Resultado: capa encima de `result`, anclado abajo.
  static const resultGlow = RadialGradient(
    center: Alignment(0, 1),
    radius: 1.0,
    colors: [AppColors.night500, Color(0x004A35C4)],
    stops: [0, 0.7],
  );
  static const review = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.sky300, AppColors.sky100, AppColors.white],
    stops: [0, 0.20, 0.38],
  );
  static const orb = RadialGradient(
    center: Alignment(-0.3, -0.4),
    radius: 0.9,
    colors: [AppColors.coral300, AppColors.coral500, AppColors.magenta600],
    stops: [0, 0.55, 1],
  );
}

/// Estilos de texto. letterSpacing ya está en px (em × tamaño); height es el
/// interlineado sin unidad, igual que en CSS.
abstract final class AppTextStyles {
  static TextStyle _t(double size, FontWeight weight, {double height = 1.2, double em = 0, Color? color}) =>
      GoogleFonts.manrope(
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: em * size,
        color: color,
      );

  // Títulos
  static final screenTitle = _t(40, FontWeight.w800, height: 1.02, em: -0.04, color: AppColors.ink900);
  static final heroTitle = _t(44, FontWeight.w800, height: 1.02, em: -0.04, color: AppColors.white);
  static final sectionTitle = _t(36, FontWeight.w800, height: 1.04, em: -0.04, color: AppColors.ink900);
  static final stateTitle = _t(30, FontWeight.w800, height: 1.05, em: -0.035, color: AppColors.ink900);
  static final pageTitle = _t(28, FontWeight.w800, height: 1.15, em: -0.035, color: AppColors.ink900);

  // Splash y onboarding
  static final wordmark = _t(60, FontWeight.w800, height: 1.0, em: -0.055, color: AppColors.white);
  static final tagline = _t(17, FontWeight.w600, height: 1.3, color: AppColors.onNightMuted);
  static final onboardingTitle = _t(34, FontWeight.w800, height: 1.05, em: -0.04, color: AppColors.ink900);

  // Números
  static final amountXl = _t(46, FontWeight.w800, height: 1.15, em: -0.04, color: AppColors.ink900);
  static final rateXl = _t(44, FontWeight.w800, height: 1.0, em: -0.04, color: AppColors.white);
  static final rateMd = _t(34, FontWeight.w800, height: 1.1, em: -0.04, color: AppColors.ink900);
  static final amountLg = _t(32, FontWeight.w800, height: 1.15, em: -0.03, color: AppColors.ink900);
  static final amountMd = _t(30, FontWeight.w800, height: 1.15, em: -0.03);
  static final amountTotal = _t(28, FontWeight.w800, height: 1.15, em: -0.03, color: AppColors.ink900);
  static final amountSm = _t(26, FontWeight.w800, height: 1.15, em: -0.02, color: AppColors.white);

  // Texto
  static final bodyLg = _t(16, FontWeight.w400, height: 1.5, color: AppColors.onNightMuted);
  static final body = _t(15, FontWeight.w400, height: 1.5, color: AppColors.textMuted);
  static final bodySm = _t(14, FontWeight.w400, height: 1.5, color: AppColors.textMuted);
  static final bodyXs = _t(13, FontWeight.w400, height: 1.45, color: AppColors.textMuted);

  // Etiquetas
  static final rowTitleLg = _t(16, FontWeight.w800, color: AppColors.ink900);
  static final rowTitle = _t(15, FontWeight.w800, color: AppColors.ink900);
  static final tileTitle = _t(14, FontWeight.w800, color: AppColors.ink900);
  static final labelMd = _t(14, FontWeight.w600, height: 1.25, color: AppColors.textMuted);
  static final captionStrong = _t(13, FontWeight.w700, height: 1.25, color: AppColors.textMuted);
  static final caption = _t(13, FontWeight.w600, height: 1.25, color: AppColors.textMuted);
  static final labelSm = _t(12, FontWeight.w700, color: AppColors.textMuted);
  static final navLabel = _t(11, FontWeight.w700, color: AppColors.white);

  // Botones
  static final buttonLg = _t(16, FontWeight.w800, color: AppColors.white);
  static final buttonMd = _t(15, FontWeight.w800, color: AppColors.ink900);
  static final buttonSoft = _t(15, FontWeight.w700, color: AppColors.ink900);
  static final chip = _t(13, FontWeight.w700, color: AppColors.ink900);
}

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary600,
          onPrimary: AppColors.white,
          surface: AppColors.white,
          onSurface: AppColors.ink900,
        ),
        textTheme: GoogleFonts.manropeTextTheme(),
        sliderTheme: const SliderThemeData(
          trackHeight: AppSize.sliderTrack,
          activeTrackColor: AppColors.primary600,
          inactiveTrackColor: AppColors.track,
          thumbColor: AppColors.white,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
        ),
      );
}
