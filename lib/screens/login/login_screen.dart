import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/user_login/bloc.dart';
import 'package:kajiansunnah/bloc/user_login/user_login_bloc.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:kajiansunnah/screens/home_page.dart';
import 'package:kajiansunnah/screens/login/login_form.dart';
import 'package:kajiansunnah/screens/register/register_screen.dart';
import 'package:kajiansunnah/services/size_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';
import 'package:kajiansunnah/widgets/LoginHeader.dart';
import 'package:kajiansunnah/injection_container.dart' as di;

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserLoginBloc>(
      create: (BuildContext context) => di.sl<UserLoginBloc>(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF80a1fd),
              Color(0xFF4285F4),
              Color(0xFF80a1fd),
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<UserLoginBloc, UserLoginBlocState>(
                listener: (context, state) {
              if (state is UserLoginBlocStateOnSuccess) {
                Get.offAll(HomePage());
              }
            }, builder: (BuildContext context, state) {
              if (state is UserLoginBlocStateOnStarted) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
                  ),
                );
              }
              if (state is UserLoginBlocStateOnError) {
                return login_form(
                  email: state.email,
                  password: state.password,
                  message: state.errorMessage,
                );
              }
              return login_form();
            }),
          ),
        ),
      ),
    );
  }
}
