import 'package:flutter/material.dart';

// refferences : https://api.flutter.dev/flutter/material/TextTheme-class.html
// refferences : https://m3.material.io/styles/typography/type-scale-tokens

double _baseFontSize(BuildContext context, double fontSize) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth <= 479) {
    return fontSize * 0.75; // Small screens
  } else if (screenWidth >= 480 && screenWidth <= 639) {
    return fontSize * 0.875; // Medium screens
  } else if (screenWidth >= 640 && screenWidth <= 1023) {
    return fontSize; // Large screens
  } else if (screenWidth >= 1024 && screenWidth <= 1365) {
    return fontSize * 1.125; // X-Large screens
  } else if (screenWidth >= 1366 && screenWidth <= 1919) {
    return fontSize * 1.25; // XX-Large screens
  } else if (screenWidth >= 1920) {
    return fontSize * 1.5; // XXX-Large screens
  } else {
    return fontSize; // Default font size
  }
}

class ViscTypo {
  static TextStyle? bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: _baseFontSize(context, 12),
          );

  static TextStyle? bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: _baseFontSize(context, 14),
          );

  static TextStyle? bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: _baseFontSize(context, 16),
          );

  static TextStyle? labelSmall(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: _baseFontSize(context, 11),
          );

  static TextStyle? labelMedium(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium?.copyWith(
            fontSize: _baseFontSize(context, 12),
          );

  static TextStyle? labelLarge(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: _baseFontSize(context, 14),
          );

  static TextStyle? titleSmall(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: _baseFontSize(context, 14),
          );

  static TextStyle? titleMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: _baseFontSize(context, 16),
          );

  static TextStyle? titleLarge(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: _baseFontSize(context, 22),
          );

  static TextStyle? headlineSmall(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: _baseFontSize(context, 24),
          );

  static TextStyle? headlineMedium(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: _baseFontSize(context, 28),
          );

  static TextStyle? headlineLarge(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: _baseFontSize(context, 32),
          );

  static TextStyle? displaySmall(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: _baseFontSize(context, 36),
          );

  static TextStyle? displayMedium(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: _baseFontSize(context, 45),
          );

  static TextStyle? displayLarge(
    BuildContext context, {
    bool usePerceipedSize = false,
  }) =>
      Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: _baseFontSize(context, 57),
          );
}
