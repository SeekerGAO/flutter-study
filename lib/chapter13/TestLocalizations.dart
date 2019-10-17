import 'package:flutter/material.dart';

import 'Localizations.dart';

class TestLocalizationsRoute extends StatefulWidget {
  @override
  _TestLocalizationsRouteState createState() => _TestLocalizationsRouteState();
}

class _TestLocalizationsRouteState extends State<TestLocalizationsRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(DemoLocalizations.of(context).testText),
    );
  }
}
