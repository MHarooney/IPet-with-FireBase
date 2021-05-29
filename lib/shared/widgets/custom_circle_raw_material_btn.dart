import 'package:flutter/material.dart';

class CustomCircleBtn extends StatelessWidget {
  CustomCircleBtn({
    this.onPressed,
    @required this.fillColor,
    @required this.iconColor,
    this.childCard,
    this.shapeBorder,
    this.constraintWidth,
    this.constraintHeight,
  });

  final Function onPressed;
  final Color fillColor;
  final Color iconColor;
  final Widget childCard;
  final ShapeBorder shapeBorder;
  final double constraintWidth;
  final double constraintHeight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: childCard,
      onPressed: onPressed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: constraintWidth,
        height: constraintHeight,
      ),
      // shape: iPetShapeBorder,
      // shape: iPetShapeBorder,
      shape: shapeBorder,
      // shape: RoundedRectangleBorder(
      //   borderRadius: new BorderRadius.circular(30.0),
      // ),
      fillColor: fillColor,
    );
  }
}