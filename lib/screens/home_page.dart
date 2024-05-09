import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/routes/app_routes.dart';
import 'package:kajiansunnah/screens/home_screen.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/widgets/DrawerContent.dart';
import 'package:kajiansunnah/widgets/navbar/HomeNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return BlocProvider<HomeNavBloc>(
      create: (BuildContext context) =>
          di.sl<HomeNavBloc>()..add(HomeNavBlocChange(0)),
      child: Scaffold(
        // backgroundColor: LightColors.kLightYellow,
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BlocConsumer<HomeNavBloc, HomeNavBlocState>(
                listener: (context, state) {
              if (state.openDrawer) {
                debugPrint("dengar buka drawer");
                scaffoldKey.currentState?.openDrawer();
              }
              if (state.logout) {
                Get.offNamed(Routes.homeRoute);
              }
            }, builder: (BuildContext context, state) {
              if (state.menuActive == 0 || state.menuActive == -1) {
                return home_screen();
              }
              if (state.menuActive == 1) {
                return WillPopScope(
                  onWillPop: () {
                    BlocProvider.of<HomeNavBloc>(context)
                        .add(HomeNavBlocChange(0));
                    return Future.value(false);
                  },
                  child: Container(key: ValueKey("all")),
                );
              }
              if (state.menuActive == 2) {
                return WillPopScope(
                  onWillPop: () {
                    BlocProvider.of<HomeNavBloc>(context)
                        .add(HomeNavBlocChange(0));
                    return Future.value(false);
                  },
                  child: Container(key: ValueKey("favourite")),
                );
              }
              if (state.menuActive == 3) {
                return WillPopScope(
                  onWillPop: () {
                    BlocProvider.of<HomeNavBloc>(context)
                        .add(HomeNavBlocChange(0));
                    return Future.value(false);
                  },
                  child: Container(),
                );
              }
              return WillPopScope(
                onWillPop: () {
                  BlocProvider.of<HomeNavBloc>(context)
                      .add(HomeNavBlocChange(0));
                  return Future.value(false);
                },
                child: Container(),
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: HomeNavBar(),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: DrawerContent(),
        ),
      ),
    );
  }
}
