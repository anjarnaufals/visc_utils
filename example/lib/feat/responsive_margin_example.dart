import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

class ResponsiveMarginExample extends StatelessWidget {
  const ResponsiveMarginExample({
    super.key,
    required this.marginRule,
    required this.switchMarginRule,
  });

  final ValueNotifier<MarginRule> marginRule;
  final void Function() switchMarginRule;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent.withValues(alpha: .5),
      child: ListenableBuilder(
        listenable: marginRule,
        builder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<MarginRule>(
              title: Text(
                "Margin Optimal",
                style: ViscTypo.bodyLarge(context),
              ),
              value: MarginRule.marginOptimal,
              groupValue: marginRule.value,
              onChanged: (_) {
                switchMarginRule();
              },
            ),
            RadioListTile<MarginRule>(
              title: Text(
                "Margin M3",
                style: ViscTypo.bodyLarge(context),
              ),
              value: MarginRule.marginM3,
              groupValue: marginRule.value,
              onChanged: (_) {
                switchMarginRule();
              },
            ),
            Text(
              'Horizontal Margin Value : ${viscHorizontalMargin(context, marginRule: marginRule.value)}',
            ),
            Container(
              color: Colors.blueAccent.withValues(alpha: .5),
              padding:
                  viscHorizontalMargin(context, marginRule: marginRule.value),
              child: Text(
                'Horizontal Margin',
                style: ViscTypo.bodyMedium(context),
              ),
            ),
            const Divider(),
            Text(
                'Vertical Margin Value :${viscVerticalMargin(context, marginRule: marginRule.value)}'),
            Container(
              color: Colors.greenAccent.withValues(alpha: .5),
              padding:
                  viscVerticalMargin(context, marginRule: marginRule.value),
              child: Text(
                'Vertical Margin',
                style: ViscTypo.bodyMedium(context),
              ),
            ),
            const Divider(),
            Text(
                'All Margin Value :${viscAllMargin(context, marginRule: marginRule.value)}'),
            Container(
              color: Colors.yellowAccent.withValues(alpha: .5),
              padding: viscAllMargin(context, marginRule: marginRule.value),
              child: Text(
                'All Margin',
                style: ViscTypo.bodyMedium(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
