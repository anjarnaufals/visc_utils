import 'package:flutter/material.dart';
import 'package:visc_utils/src/fluent_2_layout.dart';

class Fluent2LayoutWidget extends StatelessWidget {
  const Fluent2LayoutWidget({
    super.key,
    this.small,
    this.medium,
    this.large,
    this.xLarge,
    this.xxLarge,
    this.xxxLarge,
  });

  final Widget? small;
  final Widget? medium;
  final Widget? large;
  final Widget? xLarge;
  final Widget? xxLarge;
  final Widget? xxxLarge;

  @override
  Widget build(BuildContext context) {
    var layout = context.fluent2Layout;

    switch (layout) {
      case Fluent2Layout.small:
        return small ?? const SizedBox.shrink();
      case Fluent2Layout.medium:
        return medium ?? const SizedBox.shrink();
      case Fluent2Layout.large:
        return large ?? const SizedBox.shrink();
      case Fluent2Layout.xLarge:
        return xLarge ?? const SizedBox.shrink();
      case Fluent2Layout.xxLarge:
        return xxLarge ?? const SizedBox.shrink();
      default:
        return xxxLarge ?? const SizedBox.shrink();
    }
  }
}
