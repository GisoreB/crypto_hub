import 'package:crypto_hub/style/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final Color bgColor;
  final Color textColor;
  final Function() onTap;
  final EdgeInsets padding;
  final bool showborder;

  const ButtonWidget({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.showborder = true,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final _colorUtils = ColorUtils();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      (!widget.showborder) ? EdgeInsets.zero : const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: widget.textColor,
          ),
          backgroundColor: widget.bgColor,
          foregroundColor: widget.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: (widget.showborder)
                ? BorderSide(
              color: _colorUtils.primary,
              width: 1,
            )
                : BorderSide.none,
          ),
          padding: widget.padding,
        ),
        child: Text(widget.label),
      ),
    );
  }
}