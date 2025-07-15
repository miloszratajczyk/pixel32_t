import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';

abstract class Tool {
  String get name;
  Widget buildSettingsView();

  void onPointerDown(PointerEvent event, ClothRepository repository);
  void onPointerMove(PointerEvent event, ClothRepository repository);
  void onPointerUp(PointerEvent event, ClothRepository repository);
  void onPointerSignal(PointerEvent event, ClothRepository repository);
}
