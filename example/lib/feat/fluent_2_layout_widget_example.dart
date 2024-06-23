import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

class Fluent2LayoutWidgetExample extends StatelessWidget {
  const Fluent2LayoutWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: viscAllMargin(context),
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Builder(
              builder: (context) {
                final screenSize = context.fluent2Layout;

                final textInfoLayout = Text(
                  '${screenSize.minWidth}px - ${screenSize.maxWidth}px',
                  style: ViscTypo.headlineSmall(context),
                );
                return Fluent2LayoutWidget(
                  small: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Small Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  medium: Column(
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
                  large: Column(
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
                  xLarge: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'xLarge Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  xxLarge: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'xxLarge Layout',
                        style: ViscTypo.headlineLarge(context),
                      ),
                      const SizedBox(height: 8),
                      textInfoLayout,
                    ],
                  ),
                  xxxLarge: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'xxxLarge Layout',
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
                'Fluent 2 Layout',
                style: ViscTypo.titleLarge(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
