import 'package:flutter/material.dart';
import 'package:ipet/shared/constants.dart';

import '../../configuration.dart';

class CustomIconButton extends StatelessWidget {
  Function onTap;
  IconData iconData;

  CustomIconButton({this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 55,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.6),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}