import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/core/model/v2i.dart';
import 'package:pixel32_t/features/panels/colors_panel/cubit/colors_panel_cubit.dart';
import 'package:pixel32_t/features/tools/color_picker_tool/view/colo_picker_tool_settings_view.dart';
import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
import 'package:pixel32_t/features/tools/core/model/tool.dart';

class ColorPickerTool implements Tool {
  ColorPickerTool({this.isSingleLayer = true});

  bool isSingleLayer;

  V2i? _lastPosition;
  bool _isPrimary = true;

  @override
  String get name => "Color Picker";

  @override
  String get icon => "assets/icons/color_picker.svg";

  @override
  Widget buildSettingsView() => ColorPickerToolSettingsView();

  @override
  void onPointerDown(PointerDownEvent event, BuildContext context) {
    final point = event.localPosition.toV2i();

    _lastPosition = point;
    _isPrimary = event.buttons == kPrimaryButton;

    _pickColor(point, context);
  }

  @override
  void onPointerMove(PointerMoveEvent event, BuildContext context) {
    final point = event.localPosition.toV2i();
    if (_lastPosition == point) return;
    _lastPosition = point;

    _pickColor(point, context);
  }

  @override
  void onPointerUp(PointerUpEvent event, BuildContext context) {}

  @override
  void onPointerSignal(PointerSignalEvent event, BuildContext context) {}

  void _pickColor(V2i point, BuildContext context) {
    final clothRepository = context.read<ClothRepository>();
    final colorsCubit = context.read<ColorsPanelCubit>();
    if (isSingleLayer) {
      Color color = clothRepository.getPixel(point);
      if (_isPrimary) {
        colorsCubit.setPrimaryColor(color);
      } else {
        colorsCubit.setSecondaryColor(color);
      }
    } else {
      clothRepository.getImagePixel(point).then((Color color) {
        if (_isPrimary) {
          colorsCubit.setPrimaryColor(color);
        } else {
          colorsCubit.setSecondaryColor(color);
        }
      });
    }
  }

  ColorPickerTool copyWith({bool? isSingleLayer}) {
    return ColorPickerTool(isSingleLayer: isSingleLayer ?? this.isSingleLayer);
  }
}
