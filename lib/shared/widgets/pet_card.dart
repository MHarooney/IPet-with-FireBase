import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipet/models/pets_model.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/widgets/custom_text.dart';

import '../../configuration.dart';
import '../constants.dart';

class PetCard extends StatelessWidget {
  String petId;
  String petName;
  String breed;
  String age;
  String distance;
  String gender;
  String imagePath;
  PetsModel pets;

  PetCard({
    this.petId,
    this.petName,
    this.breed,
    this.age,
    this.distance,
    this.gender,
    this.imagePath,
    this.pets,
  });

  // final colors = [
  //   Colors.blueGrey[200],
  //   Colors.green[200],
  //   Colors.pink[100],
  //   Colors.brown[200],
  //   Colors.lightBlue[200],
  // ];
  //
  // Random _random = new Random();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final randomColor = colors[_random.nextInt(colors.length)];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 240,
      child: Stack(
        children: [
          Container(
            // height: 200,
            margin: EdgeInsets.only(
              top: 70,
              bottom: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.48,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: petName,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(
                              gender == 'female'
                                  ? FontAwesomeIcons.venus
                                  : FontAwesomeIcons.mars,
                              size: 18,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        Text(
                          breed,
                          style: TextStyle(
                            fontSize: 12,
                            color: fadedBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomText(
                          text: age + ' years',
                          fontSize: 12,
                          color: fadedBlack,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 16,
                              color: primaryGreen,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: 'Distance: ' + distance + ' Km',
                              fontSize: 12,
                              color: fadedBlack,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: customShadow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Container(
            width: size.width * 0.48,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: customShadow,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  margin: EdgeInsets.only(top: 50),
                ),
                Align(
                  child: Image.network(
                    imagePath,
                    loadingBuilder: loadingNetworkImage,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}