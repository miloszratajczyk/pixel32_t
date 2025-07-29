// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'colors_panel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ColorsPanelState {

 Color get primaryColor; Color get secondaryColor; UnmodifiableListView<Color> get colorPalette;
/// Create a copy of ColorsPanelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorsPanelStateCopyWith<ColorsPanelState> get copyWith => _$ColorsPanelStateCopyWithImpl<ColorsPanelState>(this as ColorsPanelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorsPanelState&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&const DeepCollectionEquality().equals(other.colorPalette, colorPalette));
}


@override
int get hashCode => Object.hash(runtimeType,primaryColor,secondaryColor,const DeepCollectionEquality().hash(colorPalette));

@override
String toString() {
  return 'ColorsPanelState(primaryColor: $primaryColor, secondaryColor: $secondaryColor, colorPalette: $colorPalette)';
}


}

/// @nodoc
abstract mixin class $ColorsPanelStateCopyWith<$Res>  {
  factory $ColorsPanelStateCopyWith(ColorsPanelState value, $Res Function(ColorsPanelState) _then) = _$ColorsPanelStateCopyWithImpl;
@useResult
$Res call({
 Color primaryColor, Color secondaryColor, UnmodifiableListView<Color> colorPalette
});




}
/// @nodoc
class _$ColorsPanelStateCopyWithImpl<$Res>
    implements $ColorsPanelStateCopyWith<$Res> {
  _$ColorsPanelStateCopyWithImpl(this._self, this._then);

  final ColorsPanelState _self;
  final $Res Function(ColorsPanelState) _then;

/// Create a copy of ColorsPanelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryColor = null,Object? secondaryColor = null,Object? colorPalette = null,}) {
  return _then(_self.copyWith(
primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as Color,colorPalette: null == colorPalette ? _self.colorPalette : colorPalette // ignore: cast_nullable_to_non_nullable
as UnmodifiableListView<Color>,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorsPanelState].
extension ColorsPanelStatePatterns on ColorsPanelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorsPanelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorsPanelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorsPanelState value)  $default,){
final _that = this;
switch (_that) {
case _ColorsPanelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorsPanelState value)?  $default,){
final _that = this;
switch (_that) {
case _ColorsPanelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color primaryColor,  Color secondaryColor,  UnmodifiableListView<Color> colorPalette)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorsPanelState() when $default != null:
return $default(_that.primaryColor,_that.secondaryColor,_that.colorPalette);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color primaryColor,  Color secondaryColor,  UnmodifiableListView<Color> colorPalette)  $default,) {final _that = this;
switch (_that) {
case _ColorsPanelState():
return $default(_that.primaryColor,_that.secondaryColor,_that.colorPalette);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color primaryColor,  Color secondaryColor,  UnmodifiableListView<Color> colorPalette)?  $default,) {final _that = this;
switch (_that) {
case _ColorsPanelState() when $default != null:
return $default(_that.primaryColor,_that.secondaryColor,_that.colorPalette);case _:
  return null;

}
}

}

/// @nodoc


class _ColorsPanelState implements ColorsPanelState {
  const _ColorsPanelState({required this.primaryColor, required this.secondaryColor, required this.colorPalette});
  

@override final  Color primaryColor;
@override final  Color secondaryColor;
@override final  UnmodifiableListView<Color> colorPalette;

/// Create a copy of ColorsPanelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorsPanelStateCopyWith<_ColorsPanelState> get copyWith => __$ColorsPanelStateCopyWithImpl<_ColorsPanelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorsPanelState&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&const DeepCollectionEquality().equals(other.colorPalette, colorPalette));
}


@override
int get hashCode => Object.hash(runtimeType,primaryColor,secondaryColor,const DeepCollectionEquality().hash(colorPalette));

@override
String toString() {
  return 'ColorsPanelState(primaryColor: $primaryColor, secondaryColor: $secondaryColor, colorPalette: $colorPalette)';
}


}

/// @nodoc
abstract mixin class _$ColorsPanelStateCopyWith<$Res> implements $ColorsPanelStateCopyWith<$Res> {
  factory _$ColorsPanelStateCopyWith(_ColorsPanelState value, $Res Function(_ColorsPanelState) _then) = __$ColorsPanelStateCopyWithImpl;
@override @useResult
$Res call({
 Color primaryColor, Color secondaryColor, UnmodifiableListView<Color> colorPalette
});




}
/// @nodoc
class __$ColorsPanelStateCopyWithImpl<$Res>
    implements _$ColorsPanelStateCopyWith<$Res> {
  __$ColorsPanelStateCopyWithImpl(this._self, this._then);

  final _ColorsPanelState _self;
  final $Res Function(_ColorsPanelState) _then;

/// Create a copy of ColorsPanelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaryColor = null,Object? secondaryColor = null,Object? colorPalette = null,}) {
  return _then(_ColorsPanelState(
primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as Color,colorPalette: null == colorPalette ? _self.colorPalette : colorPalette // ignore: cast_nullable_to_non_nullable
as UnmodifiableListView<Color>,
  ));
}


}

// dart format on
