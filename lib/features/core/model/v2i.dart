import 'package:freezed_annotation/freezed_annotation.dart';

part 'v2i.freezed.dart';

@freezed
final class V2i with _$V2i {
  const V2i(this.x, this.y);
  @override
  final int x, y;
}
