import 'package:flutter/material.dart';
import 'package:vl/utils/themes.dart';

class ResponsiveApp extends StatelessWidget {
  final Widget ultraWideLayoutScaffold;
  final Widget wideLayoutScaffold;
  final Widget narrowLayoutScaffold;
  const ResponsiveApp(
      {super.key,
      required this.ultraWideLayoutScaffold,
      required this.wideLayoutScaffold,
      required this.narrowLayoutScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > dimenUltraWide) {
        return ultraWideLayoutScaffold;
      } else if (constraints.maxWidth > dimenWide) {
        return wideLayoutScaffold;
      } else {
        return narrowLayoutScaffold;
      }
    });
  }
}
