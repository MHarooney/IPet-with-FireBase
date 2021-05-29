import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipet/modules/on_boarding/on_boarding_screen.dart';
import 'package:ipet/shared/constants.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:ipet/shared/styles/themes.dart';

import 'bloc_observer.dart';
import 'layout/home_layout.dart';
import 'modules/login/login_screen.dart';
import 'network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    // In debug mode, use the normal error widget which shows
    // the error message:
    if (inDebug) return ErrorWidget(details.exception);
    // In release builds, show a yellow-on-blue message instead:
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error! ${details.exception}',
        style: TextStyle(color: Colors.yellow),
        textDirection: TextDirection.ltr,
      ),
    );
  };

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final Widget startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getUserData()
        ..getCategoriesData()
        ..getPetsData()
        ..getCatsData()
        ..getTurtlesData()
        ..getBannersData()
        ..getDogsData()
        ..getHamstersData()
        ..getBirdsData()
        ..getBunniesData()
        ..getFishesData()
        ..changeCategoryModelState()
        ..handleScroll(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            home: StreamBuilder<Object>(
              stream: FirebaseAuth.instance.authStateChanges(),
              // builder: (context, snapshot) {
              //   return startWidget;
              // }
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return startWidget;
                } else {
                  return LoginScreen();
                }
              },
            ),
            // home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}