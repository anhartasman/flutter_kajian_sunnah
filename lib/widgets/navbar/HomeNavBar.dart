import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/routes/app_routes.dart';
import 'package:kajiansunnah/screens/models/home_model_bottom_menu.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels();
    final authService = Get.find<AuthService>();

    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelHeight(20),
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 20, offset: const Offset(0, -2)),
        ],
      ),
      child: BlocConsumer<HomeNavBloc, HomeNavBlocState>(
          listener: (context, state) {},
          builder: (BuildContext context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(bottomMenuList.length, (index) {
                final modelItem = bottomMenuList[index];
                final selected = state.menuActive == index;
                return GestureDetector(
                  onTap: () => changeMenu(context, index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Image.asset(
                            "assets/icon/" + modelItem.iconImg,
                            color: selected ? Warna.warnaUtama : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }), // child:
    );
  }

  void changeMenu(BuildContext context, int index) {
    BlocProvider.of<HomeNavBloc>(context).add(HomeNavBlocChange(index));
  }
}
