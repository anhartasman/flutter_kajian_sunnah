import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/widgets/navbar/HomeNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return BlocProvider<HomeNavBloc>(
      create: (BuildContext context) => di.sl<HomeNavBloc>(),
      child: Scaffold(
        // backgroundColor: LightColors.kLightYellow,
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: BlocConsumer<HomeNavBloc, HomeNavBlocState>(
            listener: (context, state) {
          if (state.openDrawer) {
            debugPrint("dengar buka drawer");
            scaffoldKey.currentState?.openDrawer();
          }
        }, builder: (BuildContext context, state) {
          if (state.menuActive == 0 || state.menuActive == -1) {
            return Container();
          }
          if (state.menuActive == 1) {
            return WillPopScope(
              onWillPop: () {
                BlocProvider.of<HomeNavBloc>(context).add(HomeNavBlocChange(0));
                return Future.value(false);
              },
              child: Container(key: ValueKey("all")),
            );
          }
          if (state.menuActive == 2) {
            return WillPopScope(
              onWillPop: () {
                BlocProvider.of<HomeNavBloc>(context).add(HomeNavBlocChange(0));
                return Future.value(false);
              },
              child: Container(key: ValueKey("favourite")),
            );
          }
          if (state.menuActive == 3) {
            return WillPopScope(
              onWillPop: () {
                BlocProvider.of<HomeNavBloc>(context).add(HomeNavBlocChange(0));
                return Future.value(false);
              },
              child: Container(),
            );
          }
          return WillPopScope(
            onWillPop: () {
              BlocProvider.of<HomeNavBloc>(context).add(HomeNavBlocChange(0));
              return Future.value(false);
            },
            child: Container(),
          );
        }),
        bottomNavigationBar: HomeNavBar(),
      ),
    );
  }
}
