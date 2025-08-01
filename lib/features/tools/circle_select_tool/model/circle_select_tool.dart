import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/core/model/v2i.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/circle_select_tool/view/circle_select_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';

class CircleSelectTool extends Tool {
  V2i? _startPosition;
  V2i? _lastPosition;
  bool _isPrimary = true;
  Color _color = const Color(0xff000000);

  @override
  String get name => "Circle Select";

  @override
  String get icon => "assets/icons/circle_select.svg";

  @override
  Widget buildSettingsView() => CircleSelectToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final point = event.localPosition.toV2i();

    _lastPosition = point;
    _startPosition = point;
    _isPrimary = event.buttons == kPrimaryButton;

    _color = event.buttons == kPrimaryButton
        ? toolRepository.primaryColor
        : toolRepository.secondaryColor;

    clothRepository.previewLayer.flush();
    clothRepository.previewLayer.show();
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final point = event.localPosition.toV2i();
    if (_lastPosition == point) return;
    _lastPosition = point;

    _startPosition ??= point;
    final points = getCircleBorderPoints(_startPosition!, point);

    clothRepository.previewLayer.flush();
    for (final point in points) {
      clothRepository.setPixel(point, _color, checkSelection: false);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    // TODO: This shouldn't be done this way but works perfectly
    final selectionCubit = context.read<SelectionCubit>();
    final point = event.localPosition.toV2i();

    _startPosition ??= point;
    final points = getCircleFilledPoints(_startPosition!, point);

    if (_isPrimary) {
      points.forEach(selectionCubit.state.select);
    } else {
      points.forEach(selectionCubit.state.deselect);
    }
    selectionCubit.commit();

    clothRepository.previewLayer.flush();
    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}
}
