import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/tools/circle_tool/view/circle_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';

class CircleTool extends Tool {
  CircleTool({this.shouldFill = false});

  bool shouldFill;

  V2i? _startPosition;
  V2i? _lastPosition;
  Color _color = const Color(0xff000000);

  @override
  String get name => "Circle";

  @override
  String get icon => "assets/icons/circle.svg";

  @override
  Widget buildSettingsView() => CircleToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final point = event.localPosition.toV2i();

    _lastPosition = point;
    _startPosition = point;
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
    final points = shouldFill
        ? getCircleFilledPoints(_startPosition!, point)
        : getCircleBorderPoints(_startPosition!, point);

    clothRepository.previewLayer.flush();
    for (final point in points) {
      clothRepository.setPixel(point, _color);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();

    clothRepository.requestRedraw(shouldCommit: true);
  }

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}

  CircleTool copyWith({bool? shouldFill}) {
    return CircleTool(shouldFill: shouldFill ?? this.shouldFill);
  }
}
