import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedToolIcon extends StatelessWidget {
  /// Draws the svg icon from given `assetPath`
  /// handles animation on color change
  const AnimatedToolIcon({
    super.key,
    required this.assetPath,
    required this.color,
    this.size = 32,
    this.duration = const Duration(milliseconds: 300),
  });

  final String assetPath;
  final Color color;
  final double size;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(end: color),
      duration: duration,
      builder: (context, animatedColor, child) {
        return SvgPicture.asset(
          assetPath,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(animatedColor!, BlendMode.srcIn),
        );
      },
    );
  }
}
