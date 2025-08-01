import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/core/model/v2i.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/lasso_select_tool/view/lasso_select_tool_settings_view.dart';

class LassoSelectTool extends Tool {
  final List<V2i> _path = [];
  bool _isPrimary = true;
  Color _color = const Color(0xff000000);

  @override
  String get name => "Lasso Select";

  @override
  String get icon => "assets/icons/lasso_select.svg";

  @override
  Widget buildSettingsView() => LassoSelectToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final point = event.localPosition.toV2i();

    _path.clear();
    _path.add(point);

    _isPrimary = event.buttons == kPrimaryButton;
    _color = _isPrimary
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

    final outlinePoints = getPolygonBorderPoints(_path);
    clothRepository.previewLayer.flush();
    for (final point in outlinePoints) {
      clothRepository.setPixel(point, _color, checkSelection: false);
    }

    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final selectionCubit = context.read<SelectionCubit>();

    if (_path.length < 3) return;

    final filled = scanlineFillPolygon(_path);

    if (_isPrimary) {
      filled.forEach(selectionCubit.state.select);
    } else {
      filled.forEach(selectionCubit.state.deselect);
    }
    selectionCubit.commit();

    clothRepository.previewLayer.flush();
    clothRepository.previewLayer.markForRedraw();
    clothRepository.requestRedraw();

    _path.clear();
  }

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}
}
