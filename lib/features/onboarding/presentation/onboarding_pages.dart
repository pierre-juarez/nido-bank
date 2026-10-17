import 'package:nido_bank/core/components/components.dart';
import 'package:nido_bank/features/onboarding/presentation/onboarding_page_data.dart';

/// Las tres páginas del prototipo.
const nidoOnboardingPages = [
  NidoOnboardingPageData(
    illustration: NidoIllustrations.house,
    illustrationWidth: 240,
    illustrationHeight: 192,
    title: 'Tu hipoteca, en un solo lugar',
    body: 'Mira el valor de tu casa, tu saldo y tu próximo pago sin pedir papeles.',
    floatDuration: Duration(milliseconds: 4000),
  ),
  NidoOnboardingPageData(
    illustration: NidoIllustrations.key,
    illustrationWidth: 250,
    illustrationHeight: 205,
    title: 'Comparte el pago a tu medida',
    body: 'Si pagas junto a alguien, ajusta tu parte con un solo deslizador.',
  ),
  NidoOnboardingPageData(
    illustration: NidoIllustrations.paperPlane,
    illustrationWidth: 290,
    illustrationHeight: 145,
    title: 'Ofertas en 48 horas',
    body: 'Revisamos tu solicitud por ti y te avisamos apenas haya ofertas para ti.',
  ),
];
