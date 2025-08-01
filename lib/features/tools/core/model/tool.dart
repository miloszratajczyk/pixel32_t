import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

abstract class Tool {
  /// Short label used to identify tool
  String get name;

  /// Icon path used for icons in the toolbar
  String get icon;

  /// Widget controlling the settings o the tool
  Widget buildSettingsView();

  void onPointerDown(PointerDownEvent event, BuildContext context);
  void onPointerMove(PointerMoveEvent event, BuildContext context);
  void onPointerUp(PointerUpEvent event, BuildContext context);
  void onPointerSignal(PointerSignalEvent event, BuildContext context);
}
