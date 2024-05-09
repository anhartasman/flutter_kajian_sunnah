import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/routes/app_routes.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/ButtonProfileMenu.dart';
import 'package:kajiansunnah/widgets/PhotoUser.dart';
import 'package:kajiansunnah/widgets/TampilanDialog.dart';

class DrawerContent extends StatefulWidget {
  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final authService = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: warnaUtama,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    if (!authService.isLoggedIn) {
      return Container(
        color: Colors.white,
      );
    }
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final theUser = authService.theUser!;
    return Container(
      color: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: statusBarHeight + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelHeight(20),
                vertical: FetchPixels.getPixelHeight(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: shadowColor,
                      blurRadius: 20,
                      offset: const Offset(0, -2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: FetchPixels.getPixelHeight(12),
                      ),
                      child: Icon(Icons.close),
                    ),
                  ),
                  Row(
                    children: [
                      PhotoUser(),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              theUser.profil.name,
                              style: OpenSansSemiBold12.copyWith(
                                fontSize: 17,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 2)),
                            Text(
                              theUser.email,
                              style: OpenSansLight11.copyWith(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: shadowColor,
                      blurRadius: 20,
                      offset: const Offset(0, -2)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    ButtonProfileMenu(
                        title: "Update Profile",
                        subtitle: "You can update your profile here"),
                    ButtonProfileMenu(
                        title: "Change Password",
                        subtitle: "You can change password here"),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  TampilanDialog.showDialogKonfirm("Ingin logout?")
                      .then((value) {
                    if (value) {
                      authService.logout();

                      BlocProvider.of<HomeNavBloc>(context)
                          .add(HomeNavLogout());
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor,
                          blurRadius: 20,
                          offset: const Offset(0, -2)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Logout",
                              style: OpenSansBold16.copyWith(
                                color: Warna.orange,
                              ),
                            ),
                            Text(
                              "You can logout your session here",
                              style: OpenSansRegular11.copyWith(
                                color: Warna.abuGelap,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Warna.orange,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
