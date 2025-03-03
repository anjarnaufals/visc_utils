import 'package:flutter/material.dart';

// refferences : https://api.flutter.dev/flutter/material/TextTheme-class.html
// refferences : https://m3.material.io/styles/typography/type-scale-tokens

double _baseFontSize(
  BuildContext context,
  double fontSize, {
  bool useWidthCalculation = true,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  double devicePixelRatioMultiplier = devicePixelRatio > 2 ? 1.1 : 1.0;

  if (screenWidth <= 479) {
    return useWidthCalculation
        ? fontSize * 0.75 * devicePixelRatioMultiplier
        : fontSize * devicePixelRatioMultiplier; // Small screens
  }
  if (screenWidth >= 480 && screenWidth <= 639) {
    return useWidthCalculation
        ? fontSize * 0.875 * devicePixelRatioMultiplier
        : fontSize * devicePixelRatioMultiplier; // Medium screens
  }
  if (screenWidth >= 640 && screenWidth <= 1023) {
    return fontSize * devicePixelRatioMultiplier; // Large screens
  }
  if (screenWidth >= 1024 && screenWidth <= 1365) {
    return useWidthCalculation
        ? fontSize * 1.125 * devicePixelRatioMultiplier
        : fontSize * devicePixelRatioMultiplier; // X-Large screens
  }
  if (screenWidth >= 1366 && screenWidth <= 1919) {
    return useWidthCalculation
        ? fontSize * 1.25 * devicePixelRatioMultiplier
        : fontSize * devicePixelRatioMultiplier; // XX-Large screens
  }
  if (screenWidth >= 1920) {
    return useWidthCalculation
        ? fontSize * 1.5 * devicePixelRatioMultiplier
        : fontSize * devicePixelRatioMultiplier; // XXX-Large screens
  }
  {
    return fontSize; // Default font size
  }
}

class ViscTypo {
  static TextStyle? bodySmall(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: _baseFontSize(context, 12,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? bodyMedium(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: _baseFontSize(context, 14,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? bodyLarge(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: _baseFontSize(context, 16,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? labelSmall(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: _baseFontSize(context, 11,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? labelMedium(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.labelMedium?.copyWith(
            fontSize: _baseFontSize(context, 12,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? labelLarge(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: _baseFontSize(context, 14,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? titleSmall(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: _baseFontSize(context, 14,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? titleMedium(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: _baseFontSize(context, 16,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? titleLarge(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: _baseFontSize(context, 22,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? headlineSmall(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: _baseFontSize(context, 24,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? headlineMedium(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: _baseFontSize(context, 28,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? headlineLarge(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: _baseFontSize(context, 32,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? displaySmall(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: _baseFontSize(context, 36,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? displayMedium(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: _baseFontSize(context, 45,
                useWidthCalculation: useWidthCalculation),
          );

  static TextStyle? displayLarge(
    BuildContext context, {
    bool useWidthCalculation = true,
  }) =>
      Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: _baseFontSize(context, 57,
                useWidthCalculation: useWidthCalculation),
          );
}
