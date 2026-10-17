/// Contenido de una página del onboarding.
class NidoOnboardingPageData {
  const NidoOnboardingPageData({
    required this.illustration,
    required this.illustrationWidth,
    required this.illustrationHeight,
    required this.title,
    required this.body,
    this.floatDuration = const Duration(milliseconds: 3600),
  });

  final String illustration; // SVG, por ejemplo NidoIllustrations.house
  final double illustrationWidth;
  final double illustrationHeight;
  final String title;
  final String body;
  final Duration floatDuration;
}
