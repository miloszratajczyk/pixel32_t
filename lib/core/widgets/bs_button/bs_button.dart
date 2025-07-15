import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/core/widgets/bs_button/bs_button_style.dart';

class BsButton extends StatefulWidget {
  const BsButton({
    required this.onTap,
    required this.child,
    this.style = const BsButtonStyle(),
    super.key,
  });

  final void Function() onTap;
  final Widget child;
  final BsButtonStyle style;

  @override
  State<BsButton> createState() => _BsButtonState();
}

class _BsButtonState extends State<BsButton> with TickerProviderStateMixin {
  Offset cursorOffset = Offset.zero;
  bool _isHovered = false;
  late AnimationController _hoverAnimationCtrl;
  late Animation<double> _hoverAnimation;
  late AnimationController _tapAnimationCtrl;
  late Animation<double> _tapAnimation;

  @override
  void initState() {
    super.initState();

    // Hover animation
    _hoverAnimationCtrl = AnimationController(
      duration: widget.style.hoverAnimationDuration,
      vsync: this,
    );
    _hoverAnimation = Tween(begin: 0.0, end: 1.0).animate(_hoverAnimationCtrl)
      ..addListener(() {
        setState(() {});
      });

    // Tap animation
    _tapAnimationCtrl = AnimationController(
      duration: widget.style.tapAnimationDuration,
      vsync: this,
    );
    _tapAnimation = Tween(begin: 1.0, end: 0.64).animate(_tapAnimationCtrl)
      ..addListener(() {
        setState(() {});
      })
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
            child: AnimatedDefaultTextStyle(
              duration: widget.style.hoverAnimationDuration,
              style: widget.style.textStyle.copyWith(
                color: _isHovered
                    ? widget.style.onSplashTextColor
                    : widget.style.textColor,
              ),
              child: Padding(
                padding: widget.style.padding,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpalshFillPainter extends CustomPainter {
  const SpalshFillPainter({
    required this.offset,
    required this.radiusAnimationValue,
    required this.color,
  });

  final Offset offset;
  final double radiusAnimationValue;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final estimatedMaxRadius = size.height + size.width;
    canvas.clipRect(Offset.zero & size);
    canvas.drawCircle(
      offset,
      estimatedMaxRadius * radiusAnimationValue,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant SpalshFillPainter oldDelegate) {
    return radiusAnimationValue != oldDelegate.radiusAnimationValue ||
        offset != oldDelegate.offset;
  }
}
