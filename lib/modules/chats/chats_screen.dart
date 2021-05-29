import 'package:flutter/material.dart';
import 'package:ipet/shared/widgets/custom_text.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        alignment: Alignment.center,
        text: 'Chats',
      ),
    );
  }
}