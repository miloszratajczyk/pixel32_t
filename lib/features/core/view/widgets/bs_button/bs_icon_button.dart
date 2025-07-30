import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button.dart';
import 'package:pixel32_t/features/core/view/widgets/bs_button/bs_button_style.dart';

class BsIconButton extends StatefulWidget {
  const BsIconButton({
    required this.iconAssetPath,
    required this.onTap,
    this.iconSize,
    this.iconColor,
    this.style = const BsButtonStyle(padding: EdgeInsets.all(4.0)),
    super.key,
  });

  final String iconAssetPath;
  final void Function() onTap;
  final double? iconSize;
  final Color? iconColor;
  final BsButtonStyle style;

  @override
  State<BsIconButton> createState() => _BsIconButtonState();
}

class _BsIconButtonState extends State<BsIconButton>
    with TickerProviderStateMixin {
  Offset cursorOffset = Offset.zero;
  bool _isHovered = false;
  late AnimationController _hoverAnimationCtrl;
  late Animation<double> _hoverAnimation;
  late AnimationController _tapAnimationCtrl;
  late Animation<double> _tapAnimation;

  @override
  void initState() {
    super.initState();

    _hoverAnimationCtrl = AnimationController(
      duration: widget.style.hoverAnimationDuration,
      vsync: this,
    );
    _hoverAnimation = Tween(begin: 0.0, end: 1.0).animate(_hoverAnimationCtrl)
      ..addListener(() => setState(() {}));

    _tapAnimationCtrl = AnimationController(
      duration: widget.style.tapAnimationDuration,
      vsync: this,
    );
    _tapAnimation = Tween(begin: 1.0, end: 0.64).animate(_tapAnimationCtrl)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _tapAnimationCtrl.reverse();
        }
      });
  }

  @override
  void dispose() {
    _hoverAnimationCtrl.dispose();
    _tapAnimationCtrl.dispose();
    super.dispose();
  }

  void _onEnter(PointerEnterEvent details) {
    setState(() {
      _isHovered = true;
      cursorOffset = details.localPosition;
      _hoverAnimationCtrl.forward();
    });
  }

  void _onExit(PointerExitEvent details) {
    setState(() {
      _isHovered = false;
      cursorOffset = details.localPosition;
      _hoverAnimationCtrl.reverse();
    });
  }

  void _onTapDown(TapDownDetails details) {
    widget.onTap();
    setState(() {
      _tapAnimationCtrl.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final targetColor = _isHovered
        ? widget.style.onSplashTextColor
        : widget.iconColor ?? widget.style.textColor;

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: _onTapDown,
        child: Transform.scale(
          scale: _tapAnimation.value,
          child: CustomPaint(
            painter: SpalshFillPainter(
              offset: cursorOffset,
              radiusAnimationValue: _hoverAnimation.value,
              color: widget.style.splashColor,
            ),
            child: Padding(
              padding: widget.style.padding,
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(end: targetColor),
                duration: widget.style.hoverAnimationDuration,
                builder: (context, animatedColor, _) {
                  return SvgPicture.asset(
                    widget.iconAssetPath,
                    width: widget.iconSize,
                    height: widget.iconSize,
                    colorFilter: ColorFilter.mode(
                      animatedColor!,
                      BlendMode.srcIn,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
