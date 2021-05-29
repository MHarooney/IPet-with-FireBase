import 'package:flutter/material.dart';
import 'package:ipet/modules/login/login_screen.dart';
import 'package:ipet/network/local/cache_helper.dart';
import 'package:ipet/shared/components/components.dart';
import 'package:ipet/shared/constants.dart';
import 'package:ipet/shared/styles/colors.dart';
import 'package:ipet/shared/widgets/default_text_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/ipet_welcome.png',
      title: 'We are glad to serve you',
      body: 'Welcome to I-Pet,\nLet’s shop!',
    ),
    BoardingModel(
      image: 'assets/images/pet_eating.png',
      title: 'Pet Caring',
      body: 'We can let you take care about you pet \nfrom your place.',
    ),
    BoardingModel(
      image: 'assets/images/pet_places.png',
      title: 'Places near you',
      body: 'We can let you know about pet places \nin easy way.',
    ),
    BoardingModel(
      image: 'assets/images/pet_shop.png',
      title: 'Easy Shopping',
      body: 'We show the easy way \nto shop.',
    ),
  ];

  bool isLastOnBoardingPage = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DefaultTextButton(
            function: submit,
            text: 'skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(
                      () {
                        isLastOnBoardingPage = true;
                      },
                    );
                    print('last Page');
                  } else {
                    setState(
                      () {
                        isLastOnBoardingPage = false;
                      },
                    );
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultColor,
                    dotColor: Colors.grey,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLastOnBoardingPage) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.bounceInOut,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(
    BoardingModel model,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(
                '${model.image}',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
              color: blueBlack,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
              color: blueBlack,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
}