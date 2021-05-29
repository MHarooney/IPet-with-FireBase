import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipet/modules/details/details_screen.dart';
import 'package:ipet/shared/components/components.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:ipet/shared/widgets/custom_text.dart';

import 'package:ipet/shared/widgets/discover_grid_widget.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double height, width;
        int index = 0;
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
          //   Container(
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   child: Carousel(
          //     autoplay: true,
          //     showIndicator: false,
          //     images: cubit.banners[index].image,
          //   ),
          // ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomText(
                  text: "Favorites",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                child: buildPetsGridView(cubit, index),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPetsGridView(AppCubit cubit, index) {
    return Container(
      padding: EdgeInsets.only(left: 20,),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(width: 20,),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: cubit.pets.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigateTo(
                context,
                DetailsScreen(
                  pets: cubit.pets[index],
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: DiscoverGridWidget(
                petName: cubit.pets[index].name,
                age: cubit.pets[index].age,
                breed: cubit.pets[index].petType,
                gender: cubit.pets[index].gender,
                distance: cubit.pets[index].distance,
                imagePath: cubit.pets[index].image,
                favoriteOnTap: () {
                  cubit.petFavorite(cubit.petsId[index]);
                },
                favouriteBackGroundColor: cubit.,
              ),
            ),
          );
        },
      ),
    );
  }
}