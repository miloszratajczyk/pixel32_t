import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ClothTool { zoom, moveView, pencil }

class Cloth extends StatefulWidget {
  const Cloth({super.key});

  @override
  State<Cloth> createState() => _ClothState();
}

class _ClothState extends State<Cloth> {
  ui.Image? image;
  ClothTool clothTool = ClothTool.moveView;

  Offset _offset = Offset.zero;
  int _scale = 1;
  Offset? _startFocalPoint;
  Offset? _startOffset;

  void _zoomIn() {
    setState(() {
      _scale++;
    });
  }

  void _zoomOut() {
    setState(() {
      _scale--;
    });
  }

  void _onPanStart(DragStartDetails details) {
    print("PAN start ${details.kind}");
    _startFocalPoint = details.localPosition;
    _startOffset = _offset;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    print("PAN start ${details.delta}");
    if (_startFocalPoint == null || _startOffset == null) return;

    setState(() {
      _offset = _startOffset! + (details.localPosition - _startFocalPoint!);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    print("PAN start ${details.localPosition}");
    _startFocalPoint = null;
    _startOffset = null;
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (event.kind == ui.PointerDeviceKind.mouse) {
      if (event.buttons == kPrimaryMouseButton) {
        _zoomIn();
      } else if (event.buttons == kSecondaryMouseButton) {
        _zoomOut();
      }
    }
  }

  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dy < 0) {
        // Scroll up: zoom in
        _zoomIn();
      } else if (event.scrollDelta.dy > 0) {
        // Scroll down: zoom out
        _zoomOut();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerDown: _handlePointerDown,
          onPointerSignal: _handlePointerSignal,
          child: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            onSecondaryTapDown: (details) => print(details.kind),
            child: Center(
              child: Transform.scale(
                scale: _scale.toDouble(),
                child: Transform.translate(
                  offset: _offset,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TransformZoomImage extends StatefulWidget {
  final String imagePath;
  final int minScale;
  final int maxScale;

  const TransformZoomImage({
    Key? key,
    required this.imagePath,
    this.minScale = 1,
    this.maxScale = 5,
  }) : super(key: key);

  @override
  _TransformZoomImageState createState() => _TransformZoomImageState();
}

class _TransformZoomImageState extends State<TransformZoomImage> {
  int _scaleStep = 1;
  Offset _offset = Offset.zero;
  Offset? _startFocalPoint;
  Offset? _startOffset;

  void _zoomIn() {
    if (_scaleStep < widget.maxScale) {
      setState(() {
        _scaleStep++;
      });
    }
  }

  void _zoomOut() {
    if (_scaleStep > widget.minScale) {
      setState(() {
        _scaleStep--;
      });
    }
  }

  void _onPanStart(DragStartDetails details) {
    _startFocalPoint = details.localPosition;
    _startOffset = _offset;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_startFocalPoint != null && _startOffset != null) {
      setState(() {
        _offset = _startOffset! + (details.localPosition - _startFocalPoint!);
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    _startFocalPoint = null;
    _startOffset = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: Center(
            child: Transform.translate(
              offset: _offset,
              child: Transform.scale(
                scale: _scaleStep.toDouble(),
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: _zoomOut,
                child: const Icon(Icons.zoom_out),
              ),
              const SizedBox(width: 10),
              Text(
                "Zoom: ${_scaleStep}x",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _zoomIn,
                child: const Icon(Icons.zoom_in),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
