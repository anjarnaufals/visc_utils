import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

class Material3LayoutWidgetExample extends StatelessWidget {
  const Material3LayoutWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: viscAllMargin(context),
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purpleAccent),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Builder(
              builder: (context) {
                final screenSize = context.material3Layout;

                final textInfoLayout = Text(
                  '${screenSize.minWidth}px - ${screenSize.maxWidth}px',
                  style: ViscTypo.headlineSmall(context),
                );

                return Material3LayoutWidget(
                  compact: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Compact Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  medium: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Medium Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  large: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Large Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  extraLarge: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Extra Large Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  expanded: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expanded Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: viscAllMargin(context),
              child: Text(
                'Material 3 Layout',
                style: ViscTypo.titleLarge(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
