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

  final LayoutWidgetBuilder? compact;
  final LayoutWidgetBuilder? medium;
  final LayoutWidgetBuilder? large;
  final LayoutWidgetBuilder? extraLarge;
  final LayoutWidgetBuilder? expanded;

  @override
  Widget build(BuildContext context) {
    var layout = context.material3Layout;

    return LayoutBuilder(
      builder: (context, constraints) {
        switch (layout) {
          case Material3Layout.compact:
            return compact != null
                ? compact!(context, constraints)
                : const SizedBox.shrink();
          case Material3Layout.medium:
            return medium != null
                ? medium!(context, constraints)
                : const SizedBox.shrink();
          case Material3Layout.large:
            return large != null
                ? large!(context, constraints)
                : const SizedBox.shrink();

          case Material3Layout.extraLarge:
            return extraLarge != null
                ? extraLarge!(context, constraints)
                : const SizedBox.shrink();

          default:
            return expanded != null
                ? expanded!(context, constraints)
                : const SizedBox.shrink();
        }
      },
    );
  }
}
