// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloth_layer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClothLayer {

 Uint8List get buffer; set buffer(Uint8List value); bool get isVisible; set isVisible(bool value); double get opacity; set opacity(double value); BlendMode get blendMode; set blendMode(BlendMode value); ui.Image? get image; set image(ui.Image? value);
/// Create a copy of ClothLayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClothLayerCopyWith<ClothLayer> get copyWith => _$ClothLayerCopyWithImpl<ClothLayer>(this as ClothLayer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClothLayer&&const DeepCollectionEquality().equals(other.buffer, buffer)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.blendMode, blendMode) || other.blendMode == blendMode)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(buffer),isVisible,opacity,blendMode,image);

@override
String toString() {
  return 'ClothLayer(buffer: $buffer, isVisible: $isVisible, opacity: $opacity, blendMode: $blendMode, image: $image)';
}


}

/// @nodoc
abstract mixin class $ClothLayerCopyWith<$Res>  {
  factory $ClothLayerCopyWith(ClothLayer value, $Res Function(ClothLayer) _then) = _$ClothLayerCopyWithImpl;
@useResult
$Res call({
 Uint8List buffer, bool isVisible, double opacity, BlendMode blendMode
});




}
/// @nodoc
class _$ClothLayerCopyWithImpl<$Res>
    implements $ClothLayerCopyWith<$Res> {
  _$ClothLayerCopyWithImpl(this._self, this._then);

  final ClothLayer _self;
  final $Res Function(ClothLayer) _then;

/// Create a copy of ClothLayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buffer = null,Object? isVisible = null,Object? opacity = null,Object? blendMode = null,}) {
  return _then(ClothLayer(
buffer: null == buffer ? _self.buffer : buffer // ignore: cast_nullable_to_non_nullable
as Uint8List,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,blendMode: null == blendMode ? _self.blendMode : blendMode // ignore: cast_nullable_to_non_nullable
as BlendMode,
  ));
}

}


/// Adds pattern-matching-related methods to [ClothLayer].
extension ClothLayerPatterns on ClothLayer {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
