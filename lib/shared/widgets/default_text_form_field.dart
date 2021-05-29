import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function onSubmit;
  final Function onChange;
  final Function onTap;
  final bool isPassword;
  final Function validate;
  final String label;
  final IconData prefix;
  final IconData suffix;
  final Function suffixPressed;
  final bool isClickable;
  final Function onSave;

  const DefaultTextFormField({
    Key key,
    this.controller,
    @required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    @required this.validate,
    @required this.label,
    @required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.onSave,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}