import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/core/model/v2i.dart';
import 'package:pixel32_t/features/selection_layer/cubit/selection_cubit.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';
import 'package:pixel32_t/features/tools/core/repo/tool_repository.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/polygon_select_tool/view/polygon_select_tool_settings_view.dart';

class PolygonSelectTool extends Tool {
  final List<V2i> _path = [];
  bool _isPrimary = true;
  bool _isSelecting = true;
  Color _color = const Color(0xff000000);

  @override
  String get name => "Polygon Select";

  @override
  String get icon => "assets/icons/polygon_select.svg";

  @override
  Widget buildSettingsView() => PolygonSelectToolSettingsView();

  // First click sets the starting point if LMB select if RMB deselct
  // Any other click if LMB add a point if RMB end path

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final toolRepository = context.read<ToolRepository>();
    final selectionCubit = context.read<SelectionCubit>();
    final point = event.localPosition.toV2i();

    _isPrimary = event.buttons == kPrimaryButton;
    _color = _isSelecting
        ? toolRepository.primaryColor
        : toolRepository.secondaryColor;

    if (_path.isEmpty) {
      // First point
      _isSelecting = _isPrimary;
      _path.add(point);

      clothRepository.previewLayer.flush();
      clothRepository.previewLayer.show();

      clothRepository.setPixel(point, _color, checkSelection: false);

      clothRepository.previewLayer.markForRedraw();
      clothRepository.requestRedraw();
    } else {
      // Another point

      if (_isPrimary) {
        _path.add(point);
      } else {
        if (_path.length >= 3) {
          final filled = scanlineFillPolygon(_path);
          if (_isSelecting) {
            filled.forEach(selectionCubit.state.select);
          } else {
            filled.forEach(selectionCubit.state.deselect);
          }

          selectionCubit.commit();
        }

        _path.clear();
      }

      clothRepository.previewLayer.flush();
      final outline = getPolygonBorderPoints(_path);
      for (final point in outline) {
        clothRepository.setPixel(point, _color, checkSelection: false);
      }
      clothRepository.previewLayer.markForRedraw();
      clothRepository.requestRedraw();
    }
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {}

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}
}
