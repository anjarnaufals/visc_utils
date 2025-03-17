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

  final LayoutWidgetBuilder? small;
  final LayoutWidgetBuilder? medium;
  final LayoutWidgetBuilder? large;
  final LayoutWidgetBuilder? xLarge;
  final LayoutWidgetBuilder? xxLarge;
  final LayoutWidgetBuilder? xxxLarge;

  @override
  Widget build(BuildContext context) {
    var layout = context.fluent2Layout;

    return LayoutBuilder(
      builder: (context, constraints) {
        switch (layout) {
          case Fluent2Layout.small:
            return small != null
                ? small!(context, constraints)
                : const SizedBox.shrink();
          case Fluent2Layout.medium:
            return medium != null
                ? medium!(context, constraints)
                : const SizedBox.shrink();
          case Fluent2Layout.large:
            return large != null
                ? large!(context, constraints)
                : const SizedBox.shrink();
          case Fluent2Layout.xLarge:
            return xLarge != null
                ? small!(context, constraints)
                : const SizedBox.shrink();
          case Fluent2Layout.xxLarge:
            return xxLarge != null
                ? xxLarge!(context, constraints)
                : const SizedBox.shrink();
          default:
            return xxxLarge != null
                ? xxLarge!(context, constraints)
                : const SizedBox.shrink();
        }
      },
    );
  }
}
