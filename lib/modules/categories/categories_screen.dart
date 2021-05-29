import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipet/modules/details/details_screen.dart';
import 'package:ipet/shared/components/components.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:ipet/shared/widgets/custom_text.dart';
import 'package:ipet/shared/widgets/pet_card.dart';

import '../../configuration.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).currentCategoryPets
      ..addAll(AppCubit.get(context).pets);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          controller: cubit.scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomText(
                  text: "Categories",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // buildCategoryItem(context),
              buildPetsCategoryItem(context),
              buildCategoriesListView(cubit)
            ],
          ),
        );
      },
    );
  }

  ListView buildCategoriesListView(AppCubit cubit) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: cubit.currentCategoryPets.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateTo(
              context,
              DetailsScreen(
                pets: cubit.currentCategoryPets[index],
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: PetCard(
              petName: cubit.currentCategoryPets[index].name,
              age: cubit.currentCategoryPets[index].age,
              breed: cubit.currentCategoryPets[index].petType,
              gender: cubit.currentCategoryPets[index].gender,
              distance: cubit.currentCategoryPets[index].distance,
              imagePath: cubit.currentCategoryPets[index].image,
            ),
          ),
        );
      },
    );
  }

  Widget buildPetsCategoryItem(context) {
    return Container(
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: AppCubit.get(context).petsCategories.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    AppCubit.get(context).changePetsCategoryBorder(index);
                    AppCubit.get(context).changeCategoryModelState();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: customShadow,
                      border:
                          AppCubit.get(context).selectedPetsCategory == index
                              ? Border.all(
                                  color: secondaryGreen,
                                  width: 2,
                                )
                              : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                      AppCubit.get(context).petsCategories[index].image,
                      scale: 1.8,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  AppCubit.get(context).petsCategories[index].name,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}