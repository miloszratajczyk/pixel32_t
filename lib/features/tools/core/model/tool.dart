import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

abstract class Tool {
  String get name;
  String get icon;
  Widget buildSettingsView();

  void onPointerDown(PointerDownEvent event, BuildContext context);
  void onPointerMove(PointerMoveEvent event, BuildContext context);
  void onPointerUp(PointerUpEvent event, BuildContext context);
  void onPointerSignal(PointerSignalEvent event, BuildContext context);
}
