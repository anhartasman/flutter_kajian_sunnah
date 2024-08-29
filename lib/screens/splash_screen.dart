import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/splash_check/bloc.dart';
import 'package:kajiansunnah/inject/MyAppSize.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/routes/app_routes.dart';
import 'package:kajiansunnah/screens/home_page.dart';
import 'package:kajiansunnah/screens/welcome_screen.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/widgets/SplashContent.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final double appWidth = MediaQuery.of(context).size.width;
    final double appHeight = MediaQuery.of(context).size.height;

    final sizeService = MyAppSize();
    sizeService.setMyHeight = appHeight;
    sizeService.setMyWidth = appWidth;
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return BlocProvider<SplashCheckBloc>(
      create: (BuildContext context) =>
          di.sl<SplashCheckBloc>()..add(SplashCheckStart()),
      child: Scaffold(
        key: ValueKey("halamanSplash"),
        // backgroundColor: LightColors.kLightYellow,
        backgroundColor: Colors.white,
        body: BlocConsumer<SplashCheckBloc, SplashCheckBlocState>(
            listener: (context, state) {
          if (state is SplashCheckOnSuccess) {
            if (state.toWelcome) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => Get.off(welcome_screen()));
            } else {
              // Future.delayed(const Duration(milliseconds: 500))
              //     .then((value) => Get.offNamed(Routes.homeMenuRoute));
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => Get.off(welcome_screen()));
            }
          }
        }, builder: (BuildContext context, state) {
          return Container(
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
              child: SplashContent());
        }),
      ),
    );
  }

  void quitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
