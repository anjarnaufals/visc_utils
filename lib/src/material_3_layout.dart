import 'package:flutter/material.dart';

class Material3Layout {
  final String name;
  final double minWidth;
  final double maxWidth;

  const Material3Layout(this.name, this.minWidth, this.maxWidth);

  static const Material3Layout compact = Material3Layout(
    'Compact',
    0,
    599,
  );
  static const Material3Layout medium = Material3Layout(
    'Medium',
    600,
    839,
  );
  static const Material3Layout expanded = Material3Layout(
    'Expanded',
    840,
    1199,
  );
  static const Material3Layout large = Material3Layout(
    'Large',
    1200,
    1599,
  );
  static const Material3Layout extraLarge = Material3Layout(
    'Extra-large',
    1600,
    double.infinity,
  );

  static List<Material3Layout> get values =>
      [compact, medium, expanded, large, extraLarge];
}

extension MediaQueryM3Extension on BuildContext {
  bool get isCompact => _getScreenSize().name == Material3Layout.compact.name;
  bool get isMedium => _getScreenSize().name == Material3Layout.medium.name;
  bool get isExpanded => _getScreenSize().name == Material3Layout.expanded.name;
  bool get isLarge => _getScreenSize().name == Material3Layout.large.name;
  bool get isExtraLarge =>
      _getScreenSize().name == Material3Layout.extraLarge.name;

  Material3Layout _getScreenSize() {
    double width = MediaQuery.of(this).size.width;
    return Material3Layout.values
        .firstWhere((size) => width >= size.minWidth && width <= size.maxWidth);
  }

  Material3Layout get material3Layout => _getScreenSize();
}

extension GenericM3LayoutValues on BuildContext {
  T? m3LayoutValueOf<T>({
    T? compact,
    T? medium,
    T? expanded,
    T? large,
    T? extraLarge,
  }) {
    final layout = material3Layout;
    if (layout == Material3Layout.compact) {
      return compact;
    } else if (layout == Material3Layout.medium) {
      return medium;
    } else if (layout == Material3Layout.expanded) {
      return expanded;
    } else if (layout == Material3Layout.large) {
      return large;
    } else {
      return extraLarge;
    }
  }
}
