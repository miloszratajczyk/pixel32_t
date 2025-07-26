import 'package:flutter/widgets.dart';

abstract class Tool {
  String get name;
  String get icon;
  Widget buildSettingsView();

  void onPointerDown(PointerEvent event, BuildContext context);
  void onPointerMove(PointerEvent event, BuildContext context);
  void onPointerUp(PointerEvent event, BuildContext context);
  void onPointerSignal(PointerEvent event, BuildContext context);
}
