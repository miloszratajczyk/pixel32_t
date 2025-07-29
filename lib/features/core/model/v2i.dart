final class V2i {
  const V2i(this.x, this.y);

  final int x;
  final int y;

  V2i operator +(V2i other) {
    return V2i(x + other.x, y + other.y);
  }

  V2i operator -(V2i other) {
    return V2i(x - other.x, y - other.y);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is V2i && other.x == x && other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => "V2i($x, $y)";
}
