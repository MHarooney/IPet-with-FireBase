import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final Function function;
  final String text;
  final TextStyle style;

  const DefaultTextButton({
    Key key,
    @required this.function,
    @required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: style,
      ),
    );
  }
}