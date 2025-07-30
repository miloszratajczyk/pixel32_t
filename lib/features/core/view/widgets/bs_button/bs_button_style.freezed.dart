// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bs_button_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BsButtonStyle {

 Color get splashColor; Color get textColor; Color get onSplashTextColor; EdgeInsets get padding; TextStyle get textStyle; Duration get hoverAnimationDuration; Duration get tapAnimationDuration;
/// Create a copy of BsButtonStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BsButtonStyleCopyWith<BsButtonStyle> get copyWith => _$BsButtonStyleCopyWithImpl<BsButtonStyle>(this as BsButtonStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BsButtonStyle&&(identical(other.splashColor, splashColor) || other.splashColor == splashColor)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.onSplashTextColor, onSplashTextColor) || other.onSplashTextColor == onSplashTextColor)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle)&&(identical(other.hoverAnimationDuration, hoverAnimationDuration) || other.hoverAnimationDuration == hoverAnimationDuration)&&(identical(other.tapAnimationDuration, tapAnimationDuration) || other.tapAnimationDuration == tapAnimationDuration));
}


@override
int get hashCode => Object.hash(runtimeType,splashColor,textColor,onSplashTextColor,padding,textStyle,hoverAnimationDuration,tapAnimationDuration);

@override
String toString() {
  return 'BsButtonStyle(splashColor: $splashColor, textColor: $textColor, onSplashTextColor: $onSplashTextColor, padding: $padding, textStyle: $textStyle, hoverAnimationDuration: $hoverAnimationDuration, tapAnimationDuration: $tapAnimationDuration)';
}


}

/// @nodoc
abstract mixin class $BsButtonStyleCopyWith<$Res>  {
  factory $BsButtonStyleCopyWith(BsButtonStyle value, $Res Function(BsButtonStyle) _then) = _$BsButtonStyleCopyWithImpl;
@useResult
$Res call({
 Color splashColor, Color textColor, Color onSplashTextColor, EdgeInsets padding, TextStyle textStyle, Duration hoverAnimationDuration, Duration tapAnimationDuration
});




}
/// @nodoc
class _$BsButtonStyleCopyWithImpl<$Res>
    implements $BsButtonStyleCopyWith<$Res> {
  _$BsButtonStyleCopyWithImpl(this._self, this._then);

  final BsButtonStyle _self;
  final $Res Function(BsButtonStyle) _then;

/// Create a copy of BsButtonStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? splashColor = null,Object? textColor = null,Object? onSplashTextColor = null,Object? padding = null,Object? textStyle = null,Object? hoverAnimationDuration = null,Object? tapAnimationDuration = null,}) {
  return _then(_self.copyWith(
splashColor: null == splashColor ? _self.splashColor : splashColor // ignore: cast_nullable_to_non_nullable
as Color,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,onSplashTextColor: null == onSplashTextColor ? _self.onSplashTextColor : onSplashTextColor // ignore: cast_nullable_to_non_nullable
as Color,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsets,textStyle: null == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as TextStyle,hoverAnimationDuration: null == hoverAnimationDuration ? _self.hoverAnimationDuration : hoverAnimationDuration // ignore: cast_nullable_to_non_nullable
as Duration,tapAnimationDuration: null == tapAnimationDuration ? _self.tapAnimationDuration : tapAnimationDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [BsButtonStyle].
extension BsButtonStylePatterns on BsButtonStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BsButtonStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BsButtonStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BsButtonStyle value)  $default,){
final _that = this;
switch (_that) {
case _BsButtonStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BsButtonStyle value)?  $default,){
final _that = this;
switch (_that) {
case _BsButtonStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color splashColor,  Color textColor,  Color onSplashTextColor,  EdgeInsets padding,  TextStyle textStyle,  Duration hoverAnimationDuration,  Duration tapAnimationDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BsButtonStyle() when $default != null:
return $default(_that.splashColor,_that.textColor,_that.onSplashTextColor,_that.padding,_that.textStyle,_that.hoverAnimationDuration,_that.tapAnimationDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color splashColor,  Color textColor,  Color onSplashTextColor,  EdgeInsets padding,  TextStyle textStyle,  Duration hoverAnimationDuration,  Duration tapAnimationDuration)  $default,) {final _that = this;
switch (_that) {
case _BsButtonStyle():
return $default(_that.splashColor,_that.textColor,_that.onSplashTextColor,_that.padding,_that.textStyle,_that.hoverAnimationDuration,_that.tapAnimationDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color splashColor,  Color textColor,  Color onSplashTextColor,  EdgeInsets padding,  TextStyle textStyle,  Duration hoverAnimationDuration,  Duration tapAnimationDuration)?  $default,) {final _that = this;
switch (_that) {
case _BsButtonStyle() when $default != null:
return $default(_that.splashColor,_that.textColor,_that.onSplashTextColor,_that.padding,_that.textStyle,_that.hoverAnimationDuration,_that.tapAnimationDuration);case _:
  return null;

}
}

}

/// @nodoc


class _BsButtonStyle implements BsButtonStyle {
  const _BsButtonStyle({this.splashColor = AppColors.foreground, this.textColor = AppColors.foreground, this.onSplashTextColor = AppColors.onForeground, this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), this.textStyle = const TextStyle(fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis), this.hoverAnimationDuration = const Duration(milliseconds: 256), this.tapAnimationDuration = const Duration(milliseconds: 128)});
  

@override@JsonKey() final  Color splashColor;
@override@JsonKey() final  Color textColor;
@override@JsonKey() final  Color onSplashTextColor;
@override@JsonKey() final  EdgeInsets padding;
@override@JsonKey() final  TextStyle textStyle;
@override@JsonKey() final  Duration hoverAnimationDuration;
@override@JsonKey() final  Duration tapAnimationDuration;

/// Create a copy of BsButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BsButtonStyleCopyWith<_BsButtonStyle> get copyWith => __$BsButtonStyleCopyWithImpl<_BsButtonStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BsButtonStyle&&(identical(other.splashColor, splashColor) || other.splashColor == splashColor)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.onSplashTextColor, onSplashTextColor) || other.onSplashTextColor == onSplashTextColor)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle)&&(identical(other.hoverAnimationDuration, hoverAnimationDuration) || other.hoverAnimationDuration == hoverAnimationDuration)&&(identical(other.tapAnimationDuration, tapAnimationDuration) || other.tapAnimationDuration == tapAnimationDuration));
}


@override
int get hashCode => Object.hash(runtimeType,splashColor,textColor,onSplashTextColor,padding,textStyle,hoverAnimationDuration,tapAnimationDuration);

@override
String toString() {
  return 'BsButtonStyle(splashColor: $splashColor, textColor: $textColor, onSplashTextColor: $onSplashTextColor, padding: $padding, textStyle: $textStyle, hoverAnimationDuration: $hoverAnimationDuration, tapAnimationDuration: $tapAnimationDuration)';
}


}

/// @nodoc
abstract mixin class _$BsButtonStyleCopyWith<$Res> implements $BsButtonStyleCopyWith<$Res> {
  factory _$BsButtonStyleCopyWith(_BsButtonStyle value, $Res Function(_BsButtonStyle) _then) = __$BsButtonStyleCopyWithImpl;
@override @useResult
$Res call({
 Color splashColor, Color textColor, Color onSplashTextColor, EdgeInsets padding, TextStyle textStyle, Duration hoverAnimationDuration, Duration tapAnimationDuration
});




}
/// @nodoc
class __$BsButtonStyleCopyWithImpl<$Res>
    implements _$BsButtonStyleCopyWith<$Res> {
  __$BsButtonStyleCopyWithImpl(this._self, this._then);

  final _BsButtonStyle _self;
  final $Res Function(_BsButtonStyle) _then;

/// Create a copy of BsButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? splashColor = null,Object? textColor = null,Object? onSplashTextColor = null,Object? padding = null,Object? textStyle = null,Object? hoverAnimationDuration = null,Object? tapAnimationDuration = null,}) {
  return _then(_BsButtonStyle(
splashColor: null == splashColor ? _self.splashColor : splashColor // ignore: cast_nullable_to_non_nullable
as Color,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,onSplashTextColor: null == onSplashTextColor ? _self.onSplashTextColor : onSplashTextColor // ignore: cast_nullable_to_non_nullable
as Color,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsets,textStyle: null == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as TextStyle,hoverAnimationDuration: null == hoverAnimationDuration ? _self.hoverAnimationDuration : hoverAnimationDuration // ignore: cast_nullable_to_non_nullable
as Duration,tapAnimationDuration: null == tapAnimationDuration ? _self.tapAnimationDuration : tapAnimationDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
