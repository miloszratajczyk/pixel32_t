import 'package:flutter/material.dart';

class ResizableTabs extends StatefulWidget {
  const ResizableTabs({
    super.key,
    this.axis = Axis.horizontal,
    this.tabFlexes,
    this.minTabSizes,
    required this.dividerSize,
    required this.divider,
    required this.children,
  });

  final Axis axis;
  final List<int>? tabFlexes;
  final List<double>? minTabSizes;
  final double dividerSize;
  final Widget divider;
  final List<Widget> children;

  @override
  State<ResizableTabs> createState() => _ResizableTabsState();
}

class _ResizableTabsState extends State<ResizableTabs> {
  late final List<double> _minTabSizes;
  List<double> _tabSizes = [];

  bool get isHorizontal => widget.axis == Axis.horizontal;

  @override
  void initState() {
    super.initState();
    _minTabSizes =
        widget.minTabSizes ?? List.filled(widget.children.length, 64.0);
  }

  void _calculateTabSizes(BoxConstraints constraints) {
    final tabFlexes =
        widget.tabFlexes ?? List.filled(widget.children.length, 1);
    final flexSum = tabFlexes.fold(0, (a, b) => a + b);
    final availableSize =
        (isHorizontal ? constraints.maxWidth : constraints.maxHeight) -
        (widget.dividerSize * (widget.children.length - 1));

    _tabSizes = tabFlexes.map((f) => f * (availableSize / flexSum)).toList();
  }

  void _updateSize(int ix, double? delta) {
    if (delta == null) return;
    if (_tabSizes[ix] + delta < _minTabSizes[ix]) return;
    if (_tabSizes[ix + 1] - delta < _minTabSizes[ix + 1]) return;

    setState(() {
      _tabSizes[ix] += delta;
      _tabSizes[ix + 1] -= delta;
    });
  }

  void _adjustTabSizes(BoxConstraints constraints) {
    final totalSize = isHorizontal
        ? constraints.maxWidth
        : constraints.maxHeight;
    final availableSize =
        totalSize - ((widget.children.length - 1) * widget.dividerSize);
    final currentSize = _tabSizes.fold(0.0, (a, b) => a + b);

    if ((currentSize - availableSize).abs() < 0.5) return;

    for (int i = 0; i < _tabSizes.length; i++) {
      _tabSizes[i] = (_tabSizes[i] * availableSize / currentSize).clamp(
        _minTabSizes[i],
        double.infinity,
      );
    }

    double newSize = _tabSizes.fold(0.0, (a, b) => a + b);
    if (newSize > availableSize) {
      double overflow = newSize - availableSize;
      for (int i = 0; i < _tabSizes.length && overflow > 0.0; i++) {
        final excess = _tabSizes[i] - _minTabSizes[i];
        if (excess > 0) {
          final reduction = overflow < excess ? overflow : excess;
          _tabSizes[i] -= reduction;
          overflow -= reduction;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_tabSizes.length < widget.children.length) {
          _calculateTabSizes(constraints);
        } else {
          _adjustTabSizes(constraints);
        }

        return Flex(
          direction: widget.axis,
          children: [
            for (int i = 0; i < widget.children.length; i++) ...[
              if (i != 0)
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: isHorizontal
                      ? (details) => _updateSize(i - 1, details.primaryDelta)
                      : null,
                  onVerticalDragUpdate: isHorizontal
                      ? null
                      : (details) => _updateSize(i - 1, details.primaryDelta),
                  child: SizedBox(
                    width: isHorizontal ? widget.dividerSize : null,
                    height: isHorizontal ? null : widget.dividerSize,
                    child: widget.divider,
                  ),
                ),
              SizedBox(
                width: isHorizontal ? _tabSizes[i] : null,
                height: isHorizontal ? null : _tabSizes[i],
                child: widget.children[i],
              ),
            ],
          ],
        );
      },
    );
  }
}
