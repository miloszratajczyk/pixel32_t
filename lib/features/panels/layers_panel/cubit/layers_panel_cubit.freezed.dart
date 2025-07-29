// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layers_panel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LayersPanelState {

 UnmodifiableListView<ClothLayer> get layers; int get activeLayerIx;// Used for state rebuilding equality TODO optimize
 int get version;
/// Create a copy of LayersPanelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LayersPanelStateCopyWith<LayersPanelState> get copyWith => _$LayersPanelStateCopyWithImpl<LayersPanelState>(this as LayersPanelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LayersPanelState&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.activeLayerIx, activeLayerIx) || other.activeLayerIx == activeLayerIx)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(layers),activeLayerIx,version);

@override
String toString() {
  return 'LayersPanelState(layers: $layers, activeLayerIx: $activeLayerIx, version: $version)';
}


}

/// @nodoc
abstract mixin class $LayersPanelStateCopyWith<$Res>  {
  factory $LayersPanelStateCopyWith(LayersPanelState value, $Res Function(LayersPanelState) _then) = _$LayersPanelStateCopyWithImpl;
@useResult
$Res call({
 UnmodifiableListView<ClothLayer> layers, int activeLayerIx, int version
});




}
/// @nodoc
class _$LayersPanelStateCopyWithImpl<$Res>
    implements $LayersPanelStateCopyWith<$Res> {
  _$LayersPanelStateCopyWithImpl(this._self, this._then);

  final LayersPanelState _self;
  final $Res Function(LayersPanelState) _then;

/// Create a copy of LayersPanelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? layers = null,Object? activeLayerIx = null,Object? version = null,}) {
  return _then(_self.copyWith(
layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as UnmodifiableListView<ClothLayer>,activeLayerIx: null == activeLayerIx ? _self.activeLayerIx : activeLayerIx // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LayersPanelState].
extension LayersPanelStatePatterns on LayersPanelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LayersPanelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LayersPanelState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LayersPanelState value)  $default,){
final _that = this;
switch (_that) {
case _LayersPanelState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LayersPanelState value)?  $default,){
final _that = this;
switch (_that) {
case _LayersPanelState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UnmodifiableListView<ClothLayer> layers,  int activeLayerIx,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LayersPanelState() when $default != null:
return $default(_that.layers,_that.activeLayerIx,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UnmodifiableListView<ClothLayer> layers,  int activeLayerIx,  int version)  $default,) {final _that = this;
switch (_that) {
case _LayersPanelState():
return $default(_that.layers,_that.activeLayerIx,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UnmodifiableListView<ClothLayer> layers,  int activeLayerIx,  int version)?  $default,) {final _that = this;
switch (_that) {
case _LayersPanelState() when $default != null:
return $default(_that.layers,_that.activeLayerIx,_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _LayersPanelState implements LayersPanelState {
  const _LayersPanelState({required this.layers, required this.activeLayerIx, this.version = 0});
  

@override final  UnmodifiableListView<ClothLayer> layers;
@override final  int activeLayerIx;
// Used for state rebuilding equality TODO optimize
@override@JsonKey() final  int version;

/// Create a copy of LayersPanelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LayersPanelStateCopyWith<_LayersPanelState> get copyWith => __$LayersPanelStateCopyWithImpl<_LayersPanelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LayersPanelState&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.activeLayerIx, activeLayerIx) || other.activeLayerIx == activeLayerIx)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(layers),activeLayerIx,version);

@override
String toString() {
  return 'LayersPanelState(layers: $layers, activeLayerIx: $activeLayerIx, version: $version)';
}


}

/// @nodoc
abstract mixin class _$LayersPanelStateCopyWith<$Res> implements $LayersPanelStateCopyWith<$Res> {
  factory _$LayersPanelStateCopyWith(_LayersPanelState value, $Res Function(_LayersPanelState) _then) = __$LayersPanelStateCopyWithImpl;
@override @useResult
$Res call({
 UnmodifiableListView<ClothLayer> layers, int activeLayerIx, int version
});




}
/// @nodoc
class __$LayersPanelStateCopyWithImpl<$Res>
    implements _$LayersPanelStateCopyWith<$Res> {
  __$LayersPanelStateCopyWithImpl(this._self, this._then);

  final _LayersPanelState _self;
  final $Res Function(_LayersPanelState) _then;

/// Create a copy of LayersPanelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? layers = null,Object? activeLayerIx = null,Object? version = null,}) {
  return _then(_LayersPanelState(
layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as UnmodifiableListView<ClothLayer>,activeLayerIx: null == activeLayerIx ? _self.activeLayerIx : activeLayerIx // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
