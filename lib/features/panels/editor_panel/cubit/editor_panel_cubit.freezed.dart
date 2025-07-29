// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_panel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditorPanelState {

 Offset get offset; int get scale; bool get shouldHandleScroll;
/// Create a copy of EditorPanelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditorPanelStateCopyWith<EditorPanelState> get copyWith => _$EditorPanelStateCopyWithImpl<EditorPanelState>(this as EditorPanelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditorPanelState&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.shouldHandleScroll, shouldHandleScroll) || other.shouldHandleScroll == shouldHandleScroll));
}


@override
int get hashCode => Object.hash(runtimeType,offset,scale,shouldHandleScroll);

@override
String toString() {
  return 'EditorPanelState(offset: $offset, scale: $scale, shouldHandleScroll: $shouldHandleScroll)';
}


}

/// @nodoc
abstract mixin class $EditorPanelStateCopyWith<$Res>  {
  factory $EditorPanelStateCopyWith(EditorPanelState value, $Res Function(EditorPanelState) _then) = _$EditorPanelStateCopyWithImpl;
@useResult
$Res call({
 Offset offset, int scale, bool shouldHandleScroll
});




}
/// @nodoc
class _$EditorPanelStateCopyWithImpl<$Res>
    implements $EditorPanelStateCopyWith<$Res> {
  _$EditorPanelStateCopyWithImpl(this._self, this._then);

  final EditorPanelState _self;
  final $Res Function(EditorPanelState) _then;

/// Create a copy of EditorPanelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offset = null,Object? scale = null,Object? shouldHandleScroll = null,}) {
  return _then(_self.copyWith(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Offset,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as int,shouldHandleScroll: null == shouldHandleScroll ? _self.shouldHandleScroll : shouldHandleScroll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditorPanelState].
extension EditorPanelStatePatterns on EditorPanelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditorPanelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditorPanelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditorPanelState value)  $default,){
final _that = this;
switch (_that) {
case _EditorPanelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditorPanelState value)?  $default,){
final _that = this;
switch (_that) {
case _EditorPanelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Offset offset,  int scale,  bool shouldHandleScroll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditorPanelState() when $default != null:
return $default(_that.offset,_that.scale,_that.shouldHandleScroll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Offset offset,  int scale,  bool shouldHandleScroll)  $default,) {final _that = this;
switch (_that) {
case _EditorPanelState():
return $default(_that.offset,_that.scale,_that.shouldHandleScroll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Offset offset,  int scale,  bool shouldHandleScroll)?  $default,) {final _that = this;
switch (_that) {
case _EditorPanelState() when $default != null:
return $default(_that.offset,_that.scale,_that.shouldHandleScroll);case _:
  return null;

}
}

}

/// @nodoc


class _EditorPanelState implements EditorPanelState {
  const _EditorPanelState({this.offset = Offset.zero, this.scale = 5, this.shouldHandleScroll = true});
  

@override@JsonKey() final  Offset offset;
@override@JsonKey() final  int scale;
@override@JsonKey() final  bool shouldHandleScroll;

/// Create a copy of EditorPanelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditorPanelStateCopyWith<_EditorPanelState> get copyWith => __$EditorPanelStateCopyWithImpl<_EditorPanelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditorPanelState&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.shouldHandleScroll, shouldHandleScroll) || other.shouldHandleScroll == shouldHandleScroll));
}


@override
int get hashCode => Object.hash(runtimeType,offset,scale,shouldHandleScroll);

@override
String toString() {
  return 'EditorPanelState(offset: $offset, scale: $scale, shouldHandleScroll: $shouldHandleScroll)';
}


}

/// @nodoc
abstract mixin class _$EditorPanelStateCopyWith<$Res> implements $EditorPanelStateCopyWith<$Res> {
  factory _$EditorPanelStateCopyWith(_EditorPanelState value, $Res Function(_EditorPanelState) _then) = __$EditorPanelStateCopyWithImpl;
@override @useResult
$Res call({
 Offset offset, int scale, bool shouldHandleScroll
});




}
/// @nodoc
class __$EditorPanelStateCopyWithImpl<$Res>
    implements _$EditorPanelStateCopyWith<$Res> {
  __$EditorPanelStateCopyWithImpl(this._self, this._then);

  final _EditorPanelState _self;
  final $Res Function(_EditorPanelState) _then;

/// Create a copy of EditorPanelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offset = null,Object? scale = null,Object? shouldHandleScroll = null,}) {
  return _then(_EditorPanelState(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Offset,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as int,shouldHandleScroll: null == shouldHandleScroll ? _self.shouldHandleScroll : shouldHandleScroll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
