import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:ipet/shared/styles/icon_broken.dart';
import 'package:ipet/shared/widgets/default_button.dart';
import 'package:ipet/shared/widgets/default_text_button.dart';
import 'package:ipet/shared/widgets/default_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        var userModel = AppCubit.get(context).userModel;
        var profileImage = AppCubit.get(context).profileImage;
        var coverImage = AppCubit.get(context).coverImage;

        nameController.text = userModel.name;
        phoneController.text = userModel.phone;
        bioController.text = userModel.bio;
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            actions: [
              DefaultTextButton(
                function: () {
                  AppCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                text: 'Update',
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 51.0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          // radius: responsive.height * 0.025,
                          radius: 50.0,
                          backgroundImage: profileImage == null
                              ? NetworkImage(
                                  '${userModel.image}',
                                )
                              : FileImage(profileImage),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            AppCubit.get(context).getProfileImage();
                          },
                          icon: Icon(
                            IconBroken.Camera,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (AppCubit.get(context).profileImage != null)
                    DefaultButton(
                      onPressed: () {
                        AppCubit.get(context).uploadProfileImage(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text,
                        );
                        cubit.toggle();
                      },
                      text: 'upload profile image',
                    ),
                  if (state is AppUserUpdateLoadingState)
                    SizedBox(
                      height: 5.0,
                    ),
                  if (state is AppUserUpdateLoadingState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'name must not be empty';
                      }

                      return null;
                    },
                    label: 'Name',
                    prefix: IconBroken.User,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultTextFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'bio must not be empty';
                      }

                      return null;
                    },
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'phone must not be empty';
                      }

                      return null;
                    },
                    label: 'Phone',
                    prefix: IconBroken.Call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}