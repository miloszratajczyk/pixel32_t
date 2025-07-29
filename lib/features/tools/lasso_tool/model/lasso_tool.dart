import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/lasso_tool/view/lasso_tool_settings_view.dart';

class LassoTool extends Tool {
  final List<V2i> _path = [];
  Color _color = const Color(0xff000000);

  @override
  String get name => "Lasso Fill";

  @override
  String get icon => "assets/icons/lasso.svg";

  @override
  Widget buildSettingsView() => LassoToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final point = event.localPosition.toV2i();

    _path.clear();
    _path.add(point);

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

    if (_path.isEmpty || _path.last != point) {
      _path.add(point);
    }

    final outlinePoints = scanlineFillPolygon(_path);
    clothRepository.previewLayer.flush();
    for (final point in outlinePoints) {
      clothRepository.setPixel(point, _color);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();

    clothRepository.requestRedraw(shouldCommit: true);

    _path.clear();
  }

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}
}
