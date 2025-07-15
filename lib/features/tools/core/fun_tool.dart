// import 'dart:math';

// import 'package:flutter/widgets.dart';
// import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
// import 'package:pixel32_t/features/tools/core/model/drawing_helpers.dart';
// import 'package:pixel32_t/features/tools/pencil_tool/presentation/pencil_tool_settings_view.dart';
// import 'package:pixel32_t/features/tools/core/model/tool.dart';

// class PencilTool extends Tool {
//   Point<int>? lastPosition;
//   Set<Point<int>> pointsBacklog = {};

//   @override
//   String get name => "Pencil";

//   @override
//   Widget buildSettingsView() => PencilToolSettingsView(pencilTool: this);

//   @override
//   void onPointerDown(PointerEvent event, ClothRepository repository) {
//     final point = event.localPosition.toIntPoint();
//     repository.setPixel(point);
//     lastPosition = point;
//     pointsBacklog = {};
//     repository.markLayerForRedraw();
//   }

//   @override
//   void onPointerMove(PointerEvent event, ClothRepository repository) {
//     final localPosition = event.localPosition.toIntPoint();

//     if (lastPosition == null) {
//       lastPosition = localPosition;
//       return;
//     }

//     final points = getLinePoints(lastPosition!, localPosition);

//     for (final point in points) {
//       final hasRight = pointsBacklog.contains(point + Point(1, 0));
//       final hasLeft = pointsBacklog.contains(point + Point(-1, 0));
//       final hasUp = pointsBacklog.contains(point + Point(0, -1));
//       final hasDown = pointsBacklog.contains(point + Point(0, 1));
//       if ((hasUp && (hasLeft || hasRight)) ||
//           (hasDown && (hasLeft || hasRight))) {
//       } else {
//         repository.setPixel(point);
//         pointsBacklog.add(point);
//       }
//     }

//     repository.markLayerForRedraw();
//   }

//   @override
//   void onPointerUp(PointerEvent event, ClothRepository repository) {
//     lastPosition = null;
//   }

//   @override
//   void onPointerSignal(PointerEvent event, ClothRepository repository) {}
// }
