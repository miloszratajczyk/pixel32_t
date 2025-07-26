// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToolState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToolState()';
}


}

/// @nodoc
class $ToolStateCopyWith<$Res>  {
$ToolStateCopyWith(ToolState _, $Res Function(ToolState) __);
}


/// Adds pattern-matching-related methods to [ToolState].
extension ToolStatePatterns on ToolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Pencil value)?  pencil,TResult Function( Brush value)?  brush,TResult Function( Fill value)?  fill,TResult Function( Rectangle value)?  rectangle,TResult Function( Circle value)?  circle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Pencil() when pencil != null:
return pencil(_that);case Brush() when brush != null:
return brush(_that);case Fill() when fill != null:
return fill(_that);case Rectangle() when rectangle != null:
return rectangle(_that);case Circle() when circle != null:
return circle(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Pencil value)  pencil,required TResult Function( Brush value)  brush,required TResult Function( Fill value)  fill,required TResult Function( Rectangle value)  rectangle,required TResult Function( Circle value)  circle,}){
final _that = this;
switch (_that) {
case Pencil():
return pencil(_that);case Brush():
return brush(_that);case Fill():
return fill(_that);case Rectangle():
return rectangle(_that);case Circle():
return circle(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Pencil value)?  pencil,TResult? Function( Brush value)?  brush,TResult? Function( Fill value)?  fill,TResult? Function( Rectangle value)?  rectangle,TResult? Function( Circle value)?  circle,}){
final _that = this;
switch (_that) {
case Pencil() when pencil != null:
return pencil(_that);case Brush() when brush != null:
return brush(_that);case Fill() when fill != null:
return fill(_that);case Rectangle() when rectangle != null:
return rectangle(_that);case Circle() when circle != null:
return circle(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pencil,TResult Function()?  brush,TResult Function()?  fill,TResult Function( bool shouldFill)?  rectangle,TResult Function( bool shouldFill)?  circle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Pencil() when pencil != null:
return pencil();case Brush() when brush != null:
return brush();case Fill() when fill != null:
return fill();case Rectangle() when rectangle != null:
return rectangle(_that.shouldFill);case Circle() when circle != null:
return circle(_that.shouldFill);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pencil,required TResult Function()  brush,required TResult Function()  fill,required TResult Function( bool shouldFill)  rectangle,required TResult Function( bool shouldFill)  circle,}) {final _that = this;
switch (_that) {
case Pencil():
return pencil();case Brush():
return brush();case Fill():
return fill();case Rectangle():
return rectangle(_that.shouldFill);case Circle():
return circle(_that.shouldFill);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pencil,TResult? Function()?  brush,TResult? Function()?  fill,TResult? Function( bool shouldFill)?  rectangle,TResult? Function( bool shouldFill)?  circle,}) {final _that = this;
switch (_that) {
case Pencil() when pencil != null:
return pencil();case Brush() when brush != null:
return brush();case Fill() when fill != null:
return fill();case Rectangle() when rectangle != null:
return rectangle(_that.shouldFill);case Circle() when circle != null:
return circle(_that.shouldFill);case _:
  return null;

}
}

}

/// @nodoc


class Pencil implements ToolState {
  const Pencil();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pencil);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToolState.pencil()';
}


}




/// @nodoc


class Brush implements ToolState {
  const Brush();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brush);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToolState.brush()';
}


}




/// @nodoc


class Fill implements ToolState {
  const Fill();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fill);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToolState.fill()';
}


}




/// @nodoc


class Rectangle implements ToolState {
  const Rectangle(this.shouldFill);
  

 final  bool shouldFill;

/// Create a copy of ToolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RectangleCopyWith<Rectangle> get copyWith => _$RectangleCopyWithImpl<Rectangle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rectangle&&(identical(other.shouldFill, shouldFill) || other.shouldFill == shouldFill));
}


@override
int get hashCode => Object.hash(runtimeType,shouldFill);

@override
String toString() {
  return 'ToolState.rectangle(shouldFill: $shouldFill)';
}


}

/// @nodoc
abstract mixin class $RectangleCopyWith<$Res> implements $ToolStateCopyWith<$Res> {
  factory $RectangleCopyWith(Rectangle value, $Res Function(Rectangle) _then) = _$RectangleCopyWithImpl;
@useResult
$Res call({
 bool shouldFill
});




}
/// @nodoc
class _$RectangleCopyWithImpl<$Res>
    implements $RectangleCopyWith<$Res> {
  _$RectangleCopyWithImpl(this._self, this._then);

  final Rectangle _self;
  final $Res Function(Rectangle) _then;

/// Create a copy of ToolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shouldFill = null,}) {
  return _then(Rectangle(
null == shouldFill ? _self.shouldFill : shouldFill // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Circle implements ToolState {
  const Circle(this.shouldFill);
  

 final  bool shouldFill;

/// Create a copy of ToolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CircleCopyWith<Circle> get copyWith => _$CircleCopyWithImpl<Circle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Circle&&(identical(other.shouldFill, shouldFill) || other.shouldFill == shouldFill));
}


@override
int get hashCode => Object.hash(runtimeType,shouldFill);

@override
String toString() {
  return 'ToolState.circle(shouldFill: $shouldFill)';
}


}

/// @nodoc
abstract mixin class $CircleCopyWith<$Res> implements $ToolStateCopyWith<$Res> {
  factory $CircleCopyWith(Circle value, $Res Function(Circle) _then) = _$CircleCopyWithImpl;
@useResult
$Res call({
 bool shouldFill
});




}
/// @nodoc
class _$CircleCopyWithImpl<$Res>
    implements $CircleCopyWith<$Res> {
  _$CircleCopyWithImpl(this._self, this._then);

  final Circle _self;
  final $Res Function(Circle) _then;

/// Create a copy of ToolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shouldFill = null,}) {
  return _then(Circle(
null == shouldFill ? _self.shouldFill : shouldFill // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
