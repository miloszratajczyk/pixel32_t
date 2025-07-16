import 'package:flutter/widgets.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';

abstract class Tool {
  String get name;
  String get icon;
  Widget buildSettingsView();

  void onPointerDown(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  );
  void onPointerMove(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  );
  void onPointerUp(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  );
  void onPointerSignal(
    PointerEvent event,
    ClothRepository repository,
    BuildContext context,
  );
}
