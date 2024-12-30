import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

EdgeInsets viscHorizontalMargin(
  BuildContext context, {
  MarginRule? marginRule = MarginRule.marginOptimal,
}) {
  double horizontalMargin = _typeMargin(marginRule, context);
  return EdgeInsets.symmetric(horizontal: horizontalMargin);
}

EdgeInsets viscVerticalMargin(
  BuildContext context, {
  MarginRule? marginRule = MarginRule.marginOptimal,
}) {
  double verticalMargin = _typeMargin(marginRule, context);
  return EdgeInsets.symmetric(vertical: verticalMargin);
}

EdgeInsets viscAllMargin(
  BuildContext context, {
  MarginRule? marginRule = MarginRule.marginOptimal,
}) {
  double allMargin = _typeMargin(marginRule, context);
  return EdgeInsets.all(allMargin);
}

double _typeMargin(MarginRule? marginRule, BuildContext context) {
  double horizontalMargin = marginRule.isMarginOptimal()
      ? baseMarginOptimal(context)
      : baseMarginM3(context);
  return horizontalMargin;
}
