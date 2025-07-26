// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClothState {

// Colors
 Color get primaryColor; Color get secondaryColor; Set<Color> get colorPalette;// Layers
 List<ClothLayer> get layers; int get activeLayer;// Other
 ui.Image? get image;// Whole equality is based on this value only
 int get version;
/// Create a copy of ClothState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClothStateCopyWith<ClothState> get copyWith => _$ClothStateCopyWithImpl<ClothState>(this as ClothState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClothState&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&const DeepCollectionEquality().equals(other.colorPalette, colorPalette)&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.activeLayer, activeLayer) || other.activeLayer == activeLayer)&&(identical(other.image, image) || other.image == image)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,primaryColor,secondaryColor,const DeepCollectionEquality().hash(colorPalette),const DeepCollectionEquality().hash(layers),activeLayer,image,version);

@override
String toString() {
  return 'ClothState(primaryColor: $primaryColor, secondaryColor: $secondaryColor, colorPalette: $colorPalette, layers: $layers, activeLayer: $activeLayer, image: $image, version: $version)';
}


}

/// @nodoc
abstract mixin class $ClothStateCopyWith<$Res>  {
  factory $ClothStateCopyWith(ClothState value, $Res Function(ClothState) _then) = _$ClothStateCopyWithImpl;
@useResult
$Res call({
 Color primaryColor, Color secondaryColor, Set<Color> colorPalette, List<ClothLayer> layers, int activeLayer, Image? image, int version
});




}
/// @nodoc
class _$ClothStateCopyWithImpl<$Res>
    implements $ClothStateCopyWith<$Res> {
  _$ClothStateCopyWithImpl(this._self, this._then);

  final ClothState _self;
  final $Res Function(ClothState) _then;

/// Create a copy of ClothState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryColor = null,Object? secondaryColor = null,Object? colorPalette = null,Object? layers = null,Object? activeLayer = null,Object? image = freezed,Object? version = null,}) {
  return _then(ClothState(
primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as Color,colorPalette: null == colorPalette ? _self.colorPalette : colorPalette // ignore: cast_nullable_to_non_nullable
as Set<Color>,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<ClothLayer>,activeLayer: null == activeLayer ? _self.activeLayer : activeLayer // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Image?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClothState].
extension ClothStatePatterns on ClothState {
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
