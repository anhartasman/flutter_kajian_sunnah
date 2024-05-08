import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/routes/app_routes.dart';
import 'package:kajiansunnah/screens/home_page.dart';
import 'package:kajiansunnah/screens/splash_screen.dart';

final appPages = [
  GetPage(
    name: Routes.homeRoute,
    page: () => splash_screen(),
  ),
  GetPage(
    name: Routes.homeMenuRoute,
    page: () {
      // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   systemNavigationBarColor:
      //       LightColors.kLightYellow, // navigation bar color
      //   statusBarColor: Warna.warnaUtama, // status bar color
      // ));
      return HomePage();
    },
    middlewares: [
      // MemberGuard(), // Add the middleware here
    ],
  ),
];
