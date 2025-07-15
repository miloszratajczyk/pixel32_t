import 'package:flutter/widgets.dart';
import 'package:pixel32_t/core/style/app_colors.dart';

class BsButtonStyle {
  const BsButtonStyle({
    this.splashColor = AppColors.foreground,
    this.textColor = AppColors.foreground,
    this.onSplashTextColor = AppColors.onForeground,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
    ),
    this.hoverAnimationDuration = const Duration(milliseconds: 256),
    this.tapAnimationDuration = const Duration(milliseconds: 128),
  });

  final Color splashColor;
  final Color textColor;
  final Color onSplashTextColor;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final Duration hoverAnimationDuration;
  final Duration tapAnimationDuration;
}
