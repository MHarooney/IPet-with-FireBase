import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({
    this.ipSize,
    @required this.ipFontIc,
    this.colour,
  });

  final IconData ipFontIc;
  final double ipSize;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Icon(
      ipFontIc,
      size: ipSize,
      color: colour,
    );
  }
}