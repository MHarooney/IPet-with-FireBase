import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipet/modules/login/login_screen.dart';
import 'package:ipet/network/local/cache_helper.dart';
import 'package:ipet/shared/styles/icon_broken.dart';

import 'components/components.dart';

final String tableCartProduct = 'cartProduct';
final String columnName = 'name';
final String columnImage = 'image';
final String columnQuantity = 'quantity';
final String columnPrice = 'price';
final String columnProductId = 'productId';
// const primaryColor = Color.fromRGBO(0, 197, 105, 1);
const primaryColor = Colors.cyan;

const CACHED_USER_DATA = 'CACHED_USER_DATA';

const IconData navigateNext = IconBroken.Arrow___Right_2;

final Function loadingNetworkImage =
    (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
  if (loadingProgress == null) return child;
  return Center(
    child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes
          : null,
    ),
  );
};

void signOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      FirebaseAuth.instance.signOut();
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}

String uId = '';

const Color blueBlack = Color(0xFF384163);