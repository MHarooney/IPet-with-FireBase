abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppGetCategoriesLoadingState extends AppStates {}

class AppGetCategoriesSuccessState extends AppStates {}

class AppGetCategoriesErrorState extends AppStates {
  final String error;

  AppGetCategoriesErrorState(this.error);
}

class AppGetFavoritesSuccessState extends AppStates {}

class AppGetFavoritesErrorState extends AppStates {
  final String error;

  AppGetFavoritesErrorState(this.error);
}

class AppGetBannersLoadingState extends AppStates {}

class AppGetBannersSuccessState extends AppStates {}

class AppGetBannersErrorState extends AppStates {
  final String error;

  AppGetBannersErrorState(this.error);
}

class AppGetPetsLoadingState extends AppStates {}

class AppGetPetsSuccessState extends AppStates {}

class AppGetPetsErrorState extends AppStates {
  final String error;

  AppGetPetsErrorState(this.error);
}

class AppChangeBottomNavBarState extends AppStates {}

class AppChangePetsCategoryBorderState extends AppStates {}

class AppChangeCategoryModelState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppHandleReverseHideBottomWidgetState extends AppStates {}

class AppHandleForwardHideBottomWidgetState extends AppStates {}

class AppHideBottomWidgetState extends AppStates {}

class AppHideWidgetState extends AppStates {}

class AppShowBottomWidgetState extends AppStates {}

class AppNewPostState extends AppStates {}

class AppProfileImagePickedSuccessState extends AppStates {}

class AppProfileImagePickedErrorState extends AppStates {}

class AppCoverImagePickedSuccessState extends AppStates {}

class AppCoverImagePickedErrorState extends AppStates {}

class AppUploadProfileImageSuccessState extends AppStates {}

class AppUploadProfileImageErrorState extends AppStates {}

class AppUploadCoverImageSuccessState extends AppStates {}

class AppUploadCoverImageErrorState extends AppStates {}

class AppUserUpdateLoadingState extends AppStates {}

class AppUserUpdateErrorState extends AppStates {}