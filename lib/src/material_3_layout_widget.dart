import 'package:flutter/material.dart';
import 'package:visc_utils/src/material_3_layout.dart';

class Material3LayoutWidget extends StatelessWidget {
  const Material3LayoutWidget({
    super.key,
    this.compact,
    this.medium,
    this.large,
    this.extraLarge,
    this.expanded,
  });

  final Widget? compact;
  final Widget? medium;
  final Widget? large;
  final Widget? extraLarge;
  final Widget? expanded;

  @override
  Widget build(BuildContext context) {
    var layout = context.material3Layout;

    switch (layout) {
      case Material3Layout.compact:
        return compact ?? const SizedBox.shrink();
      case Material3Layout.medium:
        return medium ?? const SizedBox.shrink();
      case Material3Layout.large:
        return large ?? const SizedBox.shrink();
      case Material3Layout.extraLarge:
        return extraLarge ?? const SizedBox.shrink();
      default:
        return expanded ?? const SizedBox.shrink();
    }
  }
}
