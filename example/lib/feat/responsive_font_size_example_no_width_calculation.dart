import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

class ResponsiveFontSizeNoWidthCalculationExample extends StatelessWidget {
  const ResponsiveFontSizeNoWidthCalculationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withValues(alpha: .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Display Large',
            style: ViscTypo.displayLarge(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Display Medium',
            style: ViscTypo.displayMedium(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Display Small',
            style: ViscTypo.displaySmall(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Headline Large',
            style: ViscTypo.headlineLarge(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Headline Medium',
            style: ViscTypo.headlineMedium(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Headline Small',
            style: ViscTypo.headlineSmall(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Title Large',
            style: ViscTypo.titleLarge(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Title Medium',
            style: ViscTypo.titleMedium(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Title Small',
            style: ViscTypo.titleSmall(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Label Large',
            style: ViscTypo.labelLarge(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Label Medium',
            style: ViscTypo.labelMedium(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Label Small',
            style: ViscTypo.labelSmall(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Body Large',
            style: ViscTypo.bodyLarge(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Body Medium',
            style: ViscTypo.bodyMedium(
              context,
              useWidthCalculation: false,
            ),
          ),
          Text(
            'Body Small',
            style: ViscTypo.bodySmall(
              context,
              useWidthCalculation: false,
            ),
          ),
        ],
      ),
    );
  }
}
