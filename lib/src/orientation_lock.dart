import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationLock extends StatefulWidget {
  const OrientationLock({
    super.key,
    required this.child,
    this.kOrientationLockBreakpoint = 600,
  });

  /// [child]
  /// the child of this widget that suppose handler ui orientation change
  final Widget child;

  /// [kOrientationLockBreakpoint]
  /// default value to 600 dp
  ///
  /// standar tablet width according material design
  final double? kOrientationLockBreakpoint;

  @override
  State<OrientationLock> createState() => _OrientationLockState();
}

class _OrientationLockState extends State<OrientationLock>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await _orientationCalculated();
      },
    );
  }

  Future<void> _orientationCalculated() async {
    double screenWidthDp = 0;
    bool isTablet = false;
    if (context.mounted) {
      screenWidthDp = MediaQuery.of(context).size.width;
      isTablet = isDeviceTablet(context, widget.kOrientationLockBreakpoint);
    }
    if (screenWidthDp < (widget.kOrientationLockBreakpoint ?? 600)) {
      // Smartphone: lock to Portrait
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      log("width $screenWidthDp dp", name: "Oriention Lock Widget");
      log("Orientation Should Lock to POTRAIT", name: "Oriention Lock Widget");
    } else if (isTablet) {
      // Tablet: lock to Landscape
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      log("width = $screenWidthDp dp", name: "Oriention Lock Widget");
      log("Orientation Should Lock to LANDSCAPE",
          name: "Oriention Lock Widget");
    }
  }

  @override
  void didChangeMetrics() async {
    await _orientationCalculated();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// detect device
bool isDeviceTablet(BuildContext context, kOrientationLockBreakpoint) {
  final mediaQuery = MediaQuery.of(context);
  final widthDp = mediaQuery.size.shortestSide;
  return widthDp >= (kOrientationLockBreakpoint ?? 600);
}
