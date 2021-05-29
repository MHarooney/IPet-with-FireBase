import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipet/models/banners_model.dart';
import 'package:ipet/models/category_model.dart';
import 'package:ipet/models/pets_model.dart';
import 'package:ipet/models/user_model.dart';
import 'package:ipet/modules/categories/categories_screen.dart';
import 'package:ipet/modules/chats/chats_screen.dart';
import 'package:ipet/modules/discover/discover_screen.dart';
import 'package:ipet/modules/favorites/favorites_screen.dart';
import 'package:ipet/modules/settings/settings_screen.dart';
import 'package:ipet/network/local/cache_helper.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<UserModel> userModelList = [];
  UserModel userModel;

  List<PetsCategory> petsCategories = [];

  List<String> petsId = [];
  List<int> favorites = [];
  List<PetsModel> pets = [];
  List<PetsModel> cats = [];
  List<PetsModel> turtles = [];
  List<PetsModel> dogs = [];
  List<PetsModel> hamsters = [];
  List<PetsModel> birds = [];
  List<PetsModel> bunnies = [];
  List<PetsModel> fishies = [];
  List<BannerModel> banners = [];

  PetsModel petModel;

  CacheHelper cacheHelper;

  void petFavorite(String petId) {
    FirebaseFirestore.instance
        .collection('pets')
        .doc(petId)
        .collection('favorites')
        .doc(userModel.uId)
        .set({
      'favorite': true,
    }).then((value) {
      emit(AppGetFavoritesSuccessState());
    }).catchError((error) {
      emit(AppGetFavoritesErrorState(error.toString()));
    });
  }

  getUserData() {
    emit(AppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  void getCategoriesData() {
    FirebaseFirestore.instance
        .collection('petsCategories')
        .orderBy("name", descending: false)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        petsCategories.add(PetsCategory.fromJson(element.data()));
      });
      emit(AppGetCategoriesSuccessState());
    }).catchError((error) {
      emit(AppGetCategoriesErrorState(error.toString()));
    });
  }

  void getBannersData() {
    FirebaseFirestore.instance.collection('banners').get().then((value) {
      value.docs.forEach((element) {
        banners.add(BannerModel.fromJson(element.data()));
      });
      emit(AppGetBannersSuccessState());
    }).catchError((error) {
      emit(AppGetBannersErrorState(error.toString()));
    });
  }

  void getPetsData() {
    FirebaseFirestore.instance.collection('pets').get().then((value) {
      value.docs.forEach((element) {
        petsId.add(element.id);
        pets.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getCatsData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'cat')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        cats.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getTurtlesData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'turtle')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        turtles.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getDogsData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'dog')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        dogs.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getHamstersData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'hamster')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        hamsters.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getBirdsData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'bird')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        birds.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getBunniesData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'bunny')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        bunnies.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void getFishesData() {
    FirebaseFirestore.instance
        .collection('pets')
        .where('type', isEqualTo: 'fish')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        fishies.add(PetsModel.fromJson(element.data()));
      });
      emit(AppGetPetsSuccessState());
    }).catchError((error) {
      emit(AppGetPetsErrorState(error.toString()));
    });
  }

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    if (index == 2) emit(state);
    emit(AppChangeBottomNavBarState());
  }

  int selectedPetsCategory = 0;

  void changePetsCategoryBorder(int index) {
    selectedPetsCategory = index;
    emit(AppChangePetsCategoryBorderState());
  }

  List<PetsModel> currentCategoryPets = [];

  void changeCategoryModelState() {
    if (selectedPetsCategory == 3) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(cats);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 0) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(pets);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 7) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(turtles);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 4) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(dogs);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 6) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(hamsters);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 1) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(birds);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 2) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(bunnies);
      print(selectedPetsCategory.toString());
    } else if (selectedPetsCategory == 5) {
      currentCategoryPets.clear();
      currentCategoryPets.addAll(fishies);
      print(selectedPetsCategory.toString());
    }
    emit(AppChangeCategoryModelState());
  }

  int currentIndex = 0;

  List<Widget> screens = [
    DiscoverScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    ChatsScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Discover',
    'Categories',
    'Favorites',
    'Chats',
    'Settings',
  ];

  ScrollController scrollController =
      ScrollController(); // set controller on scrolling
  bool show = true;

  bool visible = false;

  void toggle() {
    visible = !visible;
    emit(AppHideWidgetState());
  }

  void hideBottomWidget() {
    show = false;
    emit(AppHideBottomWidgetState());
  }

  void showBottomWidget() {
    show = true;
    emit(AppShowBottomWidgetState());
  }

  void handleScroll() async {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideBottomWidget();
        emit(AppHandleReverseHideBottomWidgetState());
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showBottomWidget();
        emit(AppHandleForwardHideBottomWidgetState());
      }
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(AppProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(AppProfileImagePickedErrorState());
    }
  }

  File coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(AppCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(AppCoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(AppUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(AppUploadProfileImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error) {
        emit(AppUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(AppUploadProfileImageErrorState());
    });
  }

  void uploadCoverImages({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(AppUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(AppUploadCoverImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((error) {
        emit(AppUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(AppUploadCoverImageErrorState());
    });
  }

  // void updateUserImage({
  //   @required String name,
  //   @required String phone,
  //   @required String bio,
  // }) {
  //   emit(AppUserUpdateLoadingState());
  //   if (coverImage != null) {
  //     uploadCoverImages();
  //   } else if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (coverImage != null && profileImage != null) {
  //   } else {
  //     updateUser(
  //       name: name,
  //       phone: phone,
  //       bio: bio,
  //     );
  //   }
  // }

  void updateUser({
    @required String name,
    @required String phone,
    @required String bio,
    String cover,
    String image,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      cover: cover ?? userModel.cover,
      image: image ?? userModel.image,
      uId: userModel.uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(AppUserUpdateErrorState());
    });
  }
}

//image_picker741202348134153624.jpg