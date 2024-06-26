import 'package:crypto_hub/components/button_widget.dart';
import 'package:crypto_hub/style/colors.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  final Color bgColor;
  final String title;
  final String subtitle;
  final String imagePath;
  final Function() onTap;
  final String buttonLabel;

  const BannerWidget({
    super.key,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.buttonLabel,
    this.imagePath = '',
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final _colorUtils = ColorUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: _colorUtils.white,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: _colorUtils.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ButtonWidget(
                  label: widget.buttonLabel,
                  onTap: widget.onTap,
                  textColor: widget.bgColor,
                  bgColor: _colorUtils.white,
                  padding: EdgeInsets.all(8),
                  showborder: false,
                )
              ],
            ),
          ),
          Image.asset(
            widget.imagePath,
            height: 90,
          ),
        ],
      ),
    );
  }
}