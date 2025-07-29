import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/pencil_tool/view/pencil_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class PencilTool implements Tool {
  V2i? _lastPosition;
  Color _color = const Color(0xff000000);

  @override
  String get name => "Pencil";

  @override
  String get icon => "assets/icons/pencil.svg";

  @override
  Widget buildSettingsView() => PencilToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final point = event.localPosition.toV2i();

    _lastPosition = point;
    _color = event.buttons == kPrimaryButton
        ? toolRepository.primaryColor
        : toolRepository.secondaryColor;

    clothRepository.previewLayer.flush();
    clothRepository.previewLayer.show();
    clothRepository.setPixel(point, _color);

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final point = event.localPosition.toV2i();
    if (_lastPosition == point) return;

    _lastPosition ??= point;
    final points = getLinePoints(_lastPosition!, point);
    for (final point in points) {
      clothRepository.setPixel(point, _color);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();

    _lastPosition = point;
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();

    clothRepository.requestRedraw(shouldCommit: true);
  }

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}
}
