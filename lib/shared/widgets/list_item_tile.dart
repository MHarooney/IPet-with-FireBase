import 'package:flutter/material.dart';

import 'custom_text.dart';


class ProfileSettingsListTileItem extends StatelessWidget {
  final String ltText;
  final IconData ltLeadingIconImage;
  final Function ltOnPressed;
  final IconData ltTrailingIcon;

  const ProfileSettingsListTileItem({
    Key key,
    @required this.ltText,
    @required this.ltLeadingIconImage,
    @required this.ltOnPressed,
    this.ltTrailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: ltOnPressed,
        child: ListTile(
          title: CustomText(
            // text: 'EditProfile',
            text: ltText,
          ),
          leading: Icon(
            // 'assets/menu_icon/Icon_Edit-Profile.png',
            ltLeadingIconImage,
          ),
          trailing: Icon(
            // Icons.navigate_next,
            ltTrailingIcon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}