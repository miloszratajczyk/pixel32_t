import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel32_t/core/view/style/app_colors.dart';
import 'bs_button.dart';
import 'bs_button_style.dart';

class BsDropdownButton<T> extends StatefulWidget {
  const BsDropdownButton({
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemToString,
    this.style = const BsButtonStyle(),
    super.key,
  });

  final List<T> items;
  final T value;
  final void Function(T) onChanged;
  final String Function(T) itemToString;
  final BsButtonStyle style;

  @override
  State<BsDropdownButton<T>> createState() => _BsDropdownButtonState<T>();
}

class _BsDropdownButtonState<T> extends State<BsDropdownButton<T>> {
  bool _expanded = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _expanded = false;
        });
      }
    });
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _focusNode.requestFocus();
      } else {
        _focusNode.unfocus();
      }
    });
  }

  void _select(T value) {
    widget.onChanged(value);
    setState(() {
      _expanded = false;
    });
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: Column(
        children: [
          BsButton(
            onTap: _toggle,
            style: widget.style,
            child: Text("Blend mode: ${widget.itemToString(widget.value)}"),
          ),
          if (_expanded)
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.primary, width: 2.0),
                ),
              ),
              padding: const EdgeInsets.only(top: 4.0),
              child: Wrap(
                children: [
                  for (final item in widget.items)
                    BsButton(
                      onTap: () => _select(item),
                      style: widget.style.copyWith(
                        textColor: item == widget.value
                            ? AppColors.primary
                            : widget.style.textColor,
                      ),
                      child: Text(
                        widget.itemToString(item),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
