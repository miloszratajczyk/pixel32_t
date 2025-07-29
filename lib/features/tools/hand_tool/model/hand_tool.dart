import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/panels/editor_panel/cubit/editor_panel_cubit.dart';
import 'package:pixel32_t/features/tools/hand_tool/view/hand_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class HandTool implements Tool {
  Offset? _startRawPosition;
  bool _isPrimary = true;

  @override
  String get name => "Hand";

  @override
  String get icon => "assets/icons/hand.svg";

  @override
  Widget buildSettingsView() => HandToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    _startRawPosition = event.position;
    _isPrimary = event.buttons == kPrimaryButton;
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {
    final editorPanelCubit = context.read<EditorPanelCubit>();
    editorPanelCubit.updateOffset(event.delta);
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {
    if (_startRawPosition != event.position) return;

    final editorPanelCubit = context.read<EditorPanelCubit>();
    if (_isPrimary) {
      editorPanelCubit.zoomIn();
    } else {
      editorPanelCubit.zoomOut();
    }
  }

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}
}
