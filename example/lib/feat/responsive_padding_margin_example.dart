import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

class ResponsivePaddingMarginExample extends StatelessWidget {
  const ResponsivePaddingMarginExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent.withOpacity(.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lisview use Horizontal Margin',
            style: ViscTypo.bodyMedium(context),
          ),
          const Divider(),
          Text(
            'Horizontal Margin Value : ${baseMargin(context)}',
          ),
          Container(
            color: Colors.blueAccent.withOpacity(.5),
            padding: viscHorizontalMargin(context),
            child: Text(
              'Horizontal Margin',
              style: ViscTypo.bodyMedium(context),
            ),
          ),
          const Divider(),
          Text('Vertical Padding Value :${basePadding(context)}'),
          Container(
            color: Colors.greenAccent.withOpacity(.5),
            padding: viscVerticalPadding(context),
            child: Text(
              'Vertical Padding',
              style: ViscTypo.bodyMedium(context),
            ),
          ),
          const Divider(),
          Text('All Padding Value :${basePadding(context)}'),
          Container(
            color: Colors.yellowAccent.withOpacity(.5),
            padding: viscAllPadding(context),
            child: Text(
              'All Padding',
              style: ViscTypo.bodyMedium(context),
            ),
          ),
        ],
      ),
    );
  }
}
