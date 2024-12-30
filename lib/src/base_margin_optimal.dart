import 'package:flutter/material.dart';

double baseMarginOptimal(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth <= 320) {
    return 13.0; // iPhone 4 & 5
  } else if (screenWidth <= 360) {
    return 14.0; // Galaxy S5
  } else if (screenWidth <= 375) {
    return 15.0; // iPhone 6, 7, & 8
  } else if (screenWidth <= 480) {
    return 16.0;
  } else if (screenWidth <= 768) {
    return 20.0; // iPad portrait
  } else if (screenWidth <= 1024) {
    return 24.0; // iPad landscape
  } else if (screenWidth <= 1280) {
    return 28.0;
  } else if (screenWidth <= 1536) {
    return 32.0;
  } else if (screenWidth <= 1920) {
    return 38.0;
  } else {
    return 48.0; // Default for screens larger than 2560px
  }
}
