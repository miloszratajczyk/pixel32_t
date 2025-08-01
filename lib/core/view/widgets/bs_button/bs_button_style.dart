import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/core/view/style/app_colors.dart';

part 'bs_button_style.freezed.dart';

@freezed
abstract class BsButtonStyle with _$BsButtonStyle {
  /// Style values used for all BsButtons
  const factory BsButtonStyle({
    @Default(AppColors.foreground) Color splashColor,
    @Default(AppColors.foreground) Color textColor,
    @Default(AppColors.onForeground) Color onSplashTextColor,
    @Default(EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0)) EdgeInsets padding,
    @Default(TextStyle(fontWeight: FontWeight.w900)) TextStyle textStyle,
    @Default(Duration(milliseconds: 256)) Duration hoverAnimationDuration,
    @Default(Duration(milliseconds: 128)) Duration tapAnimationDuration,
  }) = _BsButtonStyle;
}
