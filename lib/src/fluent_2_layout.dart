import 'package:flutter/material.dart';

class Fluent2Layout {
  final String name;
  final double minWidth;
  final double maxWidth;
  final double breakpoint;

  const Fluent2Layout(this.name, this.minWidth, this.maxWidth, this.breakpoint);

  // static const Fluent2Layout small = Fluent2Layout('Small', 320, 479, 640);
  static const Fluent2Layout small = Fluent2Layout('Small', 0, 479, 640);
  static const Fluent2Layout medium = Fluent2Layout('Medium', 480, 639, 1007);
  static const Fluent2Layout large = Fluent2Layout('Large', 640, 1023, 1008);
  static const Fluent2Layout xLarge =
      Fluent2Layout('X-Large', 1024, 1365, 1008);
  static const Fluent2Layout xxLarge =
      Fluent2Layout('XX-Large', 1366, 1919, 1008);
  static const Fluent2Layout xxxLarge =
      Fluent2Layout('XXX-Large', 1920, double.infinity, 1008);

  static List<Fluent2Layout> get values => [
        small,
        medium,
        large,
        xLarge,
        xxLarge,
        xxxLarge,
      ];
}

extension MediaQueryExtension on BuildContext {
  bool get isSmall => _getFluent2Layout().name == Fluent2Layout.small.name;
  bool get isMedium => _getFluent2Layout().name == Fluent2Layout.medium.name;
  bool get isLarge => _getFluent2Layout().name == Fluent2Layout.large.name;
  bool get isXLarge => _getFluent2Layout().name == Fluent2Layout.xLarge.name;
  bool get isXXLarge => _getFluent2Layout().name == Fluent2Layout.xxLarge.name;
  bool get isXXXLarge =>
      _getFluent2Layout().name == Fluent2Layout.xxxLarge.name;

  Fluent2Layout _getFluent2Layout() {
    double width = MediaQuery.of(this).size.width;
    return Fluent2Layout.values.firstWhere(
      (size) => width >= size.minWidth && width <= size.maxWidth,
      orElse: () => Fluent2Layout.xxxLarge, // Default to xxxLarge if no match
    );
  }

  Fluent2Layout get fluent2Layout => _getFluent2Layout();
}
