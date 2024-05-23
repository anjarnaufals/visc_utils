import 'package:flutter/material.dart';
// mobile
// compact
// range in n < 600 dp/lp

const double mobileExtraSmall = 8;
const double mobileSmall = 12;
const double mobileDefault = 16;

// tablet
// medium
// range between 600 <N> 839 dp/lp
const double tabletExtraSmall = 16;
const double tabletSmall = 20;
const double tabletDefault = 24;

// expanded, Large,
// usually dekstop
// range between 840 <N> 1599 dp/lp
const double expandedDefault = 24;

// expanded, Large,
// usually dekstop
// range in N >= 1600  dp/lp
const double extraLargeDefault = 24;

double baseMargin(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    // Mobile
    return mobileDefault;
  } else if (screenWidth >= 600 && screenWidth <= 839) {
    // Tablet
    return tabletDefault;
  } else if (screenWidth >= 840 && screenWidth <= 1599) {
    // Expanded, Large
    return expandedDefault;
  } else if (screenWidth >= 1600) {
    // Extra Large
    return extraLargeDefault;
  } else {
    // Default margin
    return mobileDefault;
  }
}

EdgeInsets viscHorizontalMargin(BuildContext context) {
  double horizontalMargin = baseMargin(context);
  return EdgeInsets.symmetric(horizontal: horizontalMargin);
}
