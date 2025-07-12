import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

class ResponsiveFontSizeExample extends StatelessWidget {
  const ResponsiveFontSizeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withValues(alpha: .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This Example Use Width Calculation',
            style: ViscTypo.displayLarge(context),
            textAlign: TextAlign.center,
          ),
          Text(
            'Display Large',
            style: ViscTypo.displayLarge(context),
          ),
          Text(
            'Display Medium',
            style: ViscTypo.displayMedium(context),
          ),
          Text(
            'Display Small',
            style: ViscTypo.displaySmall(context),
          ),
          Text(
            'Headline Large',
            style: ViscTypo.headlineLarge(context),
          ),
          Text(
            'Headline Medium',
            style: ViscTypo.headlineMedium(context),
          ),
          Text(
            'Headline Small',
            style: ViscTypo.headlineSmall(context),
          ),
          Text(
            'Title Large',
            style: ViscTypo.titleLarge(context),
          ),
          Text(
            'Title Medium',
            style: ViscTypo.titleMedium(context),
          ),
          Text(
            'Title Small',
            style: ViscTypo.titleSmall(context),
          ),
          Text(
            'Label Large',
            style: ViscTypo.labelLarge(context),
          ),
          Text(
            'Label Medium',
            style: ViscTypo.labelMedium(context),
          ),
          Text(
            'Label Small',
            style: ViscTypo.labelSmall(context),
          ),
          Text(
            'Body Large',
            style: ViscTypo.bodyLarge(context),
          ),
          Text(
            'Body Medium',
            style: ViscTypo.bodyMedium(context),
          ),
          Text(
            'Body Small',
            style: ViscTypo.bodySmall(context),
          ),
        ],
      ),
    );
  }
}
