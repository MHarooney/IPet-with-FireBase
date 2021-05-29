import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipet/modules/edit_profile/edit_profile.dart';
import 'package:ipet/modules/login/login_screen.dart';
import 'package:ipet/shared/components/components.dart';
import 'package:ipet/shared/constants.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:ipet/shared/styles/icon_broken.dart';
import 'package:ipet/shared/widgets/custom_text.dart';
import 'package:ipet/shared/widgets/default_button.dart';
import 'package:ipet/shared/widgets/list_item_tile.dart';

class SettingsScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var userModel = AppCubit
            .get(context)
            .userModel;
        var profileImage = AppCubit
            .get(context)
            .profileImage;

        nameController.text = userModel.name;
        phoneController.text = userModel.phone;
        bioController.text = userModel.bio;

        return SingleChildScrollView(
          controller: cubit.scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CircleAvatar(
                radius: 51.0,
                backgroundColor:
                Theme
                    .of(context)
                    .scaffoldBackgroundColor,
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
              Text(
                '${userModel.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 20.0,
              ),
              ProfileSettingsListTileItem(
                ltText: 'EditProfile',
                ltLeadingIconImage: IconBroken.Edit,
                ltTrailingIcon: navigateNext,
                ltOnPressed: () {
                  navigateTo(context, EditProfileScreen(),);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSettingsListTileItem(
                ltText: 'Shipping Address',
                ltLeadingIconImage: FontAwesomeIcons.solidAddressCard,
                ltTrailingIcon: navigateNext,
                ltOnPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSettingsListTileItem(
                ltText: 'Order History',
                ltLeadingIconImage: IconBroken.Time_Circle,
                ltTrailingIcon: navigateNext,
                ltOnPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSettingsListTileItem(
                ltText: 'Cards',
                ltLeadingIconImage: FontAwesomeIcons.creditCard,
                ltTrailingIcon: navigateNext,
                ltOnPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSettingsListTileItem(
                ltText: 'Notifications',
                ltLeadingIconImage: IconBroken.Notification,
                ltTrailingIcon: navigateNext,
                ltOnPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSettingsListTileItem(
                ltText: 'Rate App',
                ltLeadingIconImage: IconBroken.Star,
                ltTrailingIcon: navigateNext,
                ltOnPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSettingsListTileItem(
                ltText: 'Log Out',
                ltLeadingIconImage: IconBroken.Logout,
                ltOnPressed: () {
                  signOut(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}