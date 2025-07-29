// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';
import 'dart:ui';

import 'package:pixel32_t/features/core/model/v2i.dart';

final class SelectionLayer {
  final int width;
  final int height;
  final Uint8List _bitfield;

  /// Used to avoid comparing large binary data with state reloads
  /// and to defer reloading after changing all bits in a call
  final int version;

  const SelectionLayer({
    required this.width,
    required this.height,
    required Uint8List bitfield,
    this.version = 0,
  }) : _bitfield = bitfield;

  bool at(int x, int y) {
    if (x < 0 || x >= width || y < 0 || y >= height) {
      return false;
    }
    int index = y * width + x;
    int byteIndex = index >> 3;
    int bitOffset = index & 7;
    return (_bitfield[byteIndex] & (1 << bitOffset)) != 0;
  }

  bool isSelected(V2i point) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return false;
    }
    int index = point.y * width + point.x;
    int byteIndex = index >> 3;
    int bitOffset = index & 7;
    return (_bitfield[byteIndex] & (1 << bitOffset)) != 0;
  }

  void setSelected(V2i point, bool selected) {
    if (point.x < 0 || point.x >= width || point.y < 0 || point.y >= height) {
      return;
    }
    int index = point.y * width + point.x;
    int byteIndex = index >> 3;
    int bitOffset = index & 7;
    if (selected) {
      _bitfield[byteIndex] |= (1 << bitOffset);
    } else {
      _bitfield[byteIndex] &= ~(1 << bitOffset);
    }
  }

  void select(V2i point) {
    setSelected(point, true);
  }

  void deselect(V2i point) {
    setSelected(point, false);
  }

  void selectAll() {
    _bitfield.fillRange(0, _bitfield.length, 0xff);
  }

  void deselectAll() {
    _bitfield.fillRange(0, _bitfield.length, 0);
  }

  void invert() {
    for (int i = 0; i < _bitfield.length; i++) {
      _bitfield[i] = ~_bitfield[i];
    }
  }

  /// Returns a path containing all borders of the selection except the outer ones
  Path getBorderPath() {
    // This is fast but creates a path that is full of 1 pixel wide segments
    // which i dont like. It may be beneficial to create continous paths,
    // but on the other hand the way it is now is fast to generate,
    // so the diffrence should be tested
    final path = Path();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (at(x, y)) continue;

        final px = x.toDouble();
        final py = y.toDouble();

        // bottom
        if (at(x - 1, y)) {
          path.moveTo(px, py);
          path.lineTo(px, py + 1);
        }
        // top
        if (at(x + 1, y)) {
          path.moveTo(px + 1, py);
          path.lineTo(px + 1, py + 1);
        }
        // left
        if (at(x, y - 1)) {
          path.moveTo(px, py);
          path.lineTo(px + 1, py);
        }
        // right
        if (at(x, y + 1)) {
          path.moveTo(px, py + 1);
          path.lineTo(px + 1, py + 1);
        }
      }
    }
    return path;
  }

  SelectionLayer copyWith({int? width, int? height, Uint8List? bitfield}) {
    return SelectionLayer(
      width: width ?? this.width,
      height: height ?? this.height,
      bitfield: bitfield ?? _bitfield,
      version: version + 1,
    );
  }

  @override
  bool operator ==(covariant SelectionLayer other) {
    if (identical(this, other)) return true;
    return other.version == version;
  }

  @override
  int get hashCode {
    return width.hashCode ^
        height.hashCode ^
        _bitfield.hashCode ^
        version.hashCode;
  }
}
