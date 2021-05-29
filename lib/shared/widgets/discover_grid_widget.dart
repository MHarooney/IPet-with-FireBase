import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipet/models/pets_model.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';

import '../constants.dart';
import 'custom_icon_button.dart';

class DiscoverGridWidget extends StatelessWidget {
  String petId;
  String petName;
  String breed;
  String age;
  String distance;
  String gender;
  String imagePath;
  Function favoriteOnTap;
  PetsModel pets;
  Color favouriteBackGroundColor;
  final int index;

  DiscoverGridWidget({
    this.petId,
    this.petName,
    this.breed,
    this.age,
    this.distance,
    this.gender,
    this.imagePath,
    this.pets,
    this.index,
    this.favouriteBackGroundColor,
    this.favoriteOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(
          color: Colors.grey[200],
          width: 1,
        ),
      ),
      margin: EdgeInsets.only(
          right: index != null ? 16 : 0,
          left: index == 0 ? 16 : 0,
          bottom: 16),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Align(
                  child: Image.network(
                    imagePath,
                    loadingBuilder: loadingNetworkImage,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: pet.favorite ? Colors.red[400] : Colors.white,
                      ),
                      child: CustomIconButton(
                        iconData:Icons.favorite,
                        onTap: favoriteOnTap,
                        // color: pet.favorite ? Colors.white : Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     color: pet.condition == "Adoption" ? Colors.orange[100] : pet.condition == "Disappear" ? Colors.red[100] : Colors.blue[100],
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(10),
                //     ),
                //   ),
                //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                //   child: Text(
                //     pet.condition,
                //     style: TextStyle(
                //       color: pet.condition == "Adoption" ? Colors.orange : pet.condition == "Disappear" ? Colors.red : Colors.blue,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 12,
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 8,
                ),

                Text(
                  petName,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[600],
                      size: 18,
                    ),

                    SizedBox(
                      width: 4,
                    ),

                    // Text(
                    //   pet.location,
                    //   style: TextStyle(
                    //     color: Colors.grey[600],
                    //     fontSize: 12,
                    //   ),
                    // ),

                    SizedBox(
                      width: 4,
                    ),

                    Text(
                      "(" + distance + "km)",
                      style: TextStyle(
                        color: favouriteBackGroundColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}