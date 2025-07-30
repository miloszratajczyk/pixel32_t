import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixel32_t/features/core/view/style/app_colors.dart';

part 'bs_button_style.freezed.dart';

@freezed
abstract class BsButtonStyle with _$BsButtonStyle {
  const factory BsButtonStyle({
    @Default(AppColors.foreground) Color splashColor,
    @Default(AppColors.foreground) Color textColor,
    @Default(AppColors.onForeground) Color onSplashTextColor,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0))
    EdgeInsets padding,
    @Default(
      TextStyle(fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis),
    )
    TextStyle textStyle,
    @Default(Duration(milliseconds: 256)) Duration hoverAnimationDuration,
    @Default(Duration(milliseconds: 128)) Duration tapAnimationDuration,
  }) = _BsButtonStyle;
}
