import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipet/layout/home_layout.dart';
import 'package:ipet/modules/register/register_screen.dart';
import 'package:ipet/network/local/cache_helper.dart';
import 'package:ipet/shared/components/components.dart';
import 'package:ipet/shared/constants.dart';
import 'package:ipet/shared/widgets/custom_circle_raw_material_btn.dart';
import 'package:ipet/shared/widgets/default_button.dart';
import 'package:ipet/shared/widgets/default_icon.dart';
import 'package:ipet/shared/widgets/default_text_button.dart';
import 'package:ipet/shared/widgets/default_text_form_field.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is AppLoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is AppLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                HomeLayout(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ipet_paw_img.png',
                          width: 80,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login to ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                      color: blueBlack,
                                    ),
                              ),
                              Image.asset(
                                'assets/images/ipet_text_img.png',
                                width: 120,
                              ),
                            ],
                        ),
                        Text(
                          'Login and find your favourite pet',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        DefaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        DefaultTextFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: AppLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                              AppLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: AppLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            AppLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        state is! AppLoginLoadingState
                            ? DefaultButton(
                                width: double.infinity,
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    AppLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                                isUpperCase: true,
                              )
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomCircleBtn(
                              onPressed: () {
                                // controller.googleSignInMethod();
                              },
                              constraintWidth: 50,
                              constraintHeight: 50,
                              shapeBorder: CircleBorder(),
                              childCard: CustomIcon(
                                ipFontIc: FontAwesomeIcons.google,
                                colour: Colors.white,
                              ),
                              iconColor: Colors.white,
                              fillColor: Colors.red,
                            ),
                            CustomCircleBtn(
                              onPressed: () {
                                // controller.facebookSignInMethod();
                              },
                              constraintWidth: 50,
                              constraintHeight: 50,
                              shapeBorder: CircleBorder(),
                              childCard: CustomIcon(
                                ipFontIc: FontAwesomeIcons.facebook,
                                colour: Colors.white,
                              ),
                              iconColor: Colors.white,
                              fillColor: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: blueBlack,),
                            ),
                            DefaultTextButton(
                              function: () {
                                navigateTo(
                                  context,
                                  AppRegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                        DefaultTextButton(
                          // function: submit,
                          function: () {},
                          text: 'Not now!',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}