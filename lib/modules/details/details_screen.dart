import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipet/models/pets_model.dart';
import 'package:ipet/shared/widgets/custom_icon_button.dart';
import 'package:ipet/shared/widgets/custom_text.dart';
import 'package:ipet/shared/widgets/default_button.dart';

import '../../configuration.dart';

class DetailsScreen extends StatelessWidget {
  String id;
  Color color;
  PetsModel pets;

  DetailsScreen({this.id, this.color, this.pets});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                    color: color,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            pets.image,
                            width: size.width * 0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // CircleAvatar(
                                //   backgroundImage:
                                //   AssetImage('images/profile.jpg'),
                                // ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Anvesha Shandilya',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    CustomText(
                                      text: 'Owner',
                                      color: fadedBlack,
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                CustomText(
                                  text: 'Dec 16, 2020',
                                  color: fadedBlack,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: CustomText(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              color: fadedBlack,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 42,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.chevron_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.tray_arrow_down,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 140,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: customShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: pets.name,
                        color: fadedBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(
                        pets.gender == 'female'
                            ? FontAwesomeIcons.venus
                            : FontAwesomeIcons.mars,
                        size: 22,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: pets.petType,
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: pets.age + ' years',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 18,
                        color: primaryGreen,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: 'Bla bla bla, Bangalore, India',
                        fontSize: 14,
                        color: fadedBlack,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomIconButton(
                      iconData: CupertinoIcons.heart,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: DefaultButton(
                        text: 'Adoption',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}