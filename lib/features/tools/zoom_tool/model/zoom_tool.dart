import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/panels/editor_panel/cubit/editor_panel_cubit.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/zoom_tool/presentation/zoom_tool_settings_view.dart';

class ZoomTool extends Tool {
  @override
  String get name => "Zoom";

  @override
  String get icon => "assets/icons/pecil.svg";

  @override
  Widget buildSettingsView() => ZoomToolSettingsView(zoomTool: this);

  @override
  void onPointerDown(PointerEvent event, BuildContext context) {
    final cubit = context.read<EditorPanelCubit>();

    if (event.buttons == kPrimaryButton) {
      cubit.zoomIn();
    } else if (event.buttons == kSecondaryButton) {
      cubit.zoomOut();
    }
  }

  @override
  void onPointerMove(PointerEvent event, BuildContext context) {}

  @override
  void onPointerUp(PointerEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerEvent event, BuildContext context) {}
}
