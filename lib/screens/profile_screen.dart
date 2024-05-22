import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/screens/login/login_screen.dart';
import 'package:kajiansunnah/screens/register/register_screen.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/ButtonProfileMenu.dart';
import 'package:kajiansunnah/widgets/PhotoUser.dart';
import 'package:kajiansunnah/widgets/TampilanDialog.dart';
import 'package:kajiansunnah/widgets/reusables/ReusableWidget.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    return Scaffold(
      appBar: ReusableWidget.pageBar(
        context,
        title: "Profile",
        homePage: true,
      ),
      body: SafeArea(
        child: authService.isLoggedIn
            ? _authenticated_screen(authService.theUser!)
            : _not_login_screen(),
      ),
    );
  }
}

class _authenticated_screen extends StatelessWidget {
  final UserAccount theUser;
  const _authenticated_screen(this.theUser, {super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return ListView(
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
            child: Row(
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
                TampilanDialog.showDialogKonfirm("Ingin logout?").then((value) {
                  if (value) {
                    authService.logout();

                    BlocProvider.of<HomeNavBloc>(context).add(HomeNavLogout());
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
    );
  }
}

class _not_login_screen extends StatelessWidget {
  const _not_login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Center(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        shrinkWrap: true,
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
                children: [
                  Image.asset("assets/icon/Padlock.png"),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Text(
                    "You’re not Authenticated",
                    style: OpenSansBold16,
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    "Please do Login or Register new Account",
                    style: OpenSansLight13.copyWith(
                      color: Warna.abuGelap,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 24.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Get.to(login_screen()),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: Warna.warnaAbu.withOpacity(0.1),
                                boxShadow: [
                                  BoxShadow(
                                      color: shadowColor,
                                      blurRadius: 20,
                                      offset: const Offset(0, -2)),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: OpenSansRegular14.copyWith(
                                    fontSize: 16,
                                    color: Warna.abuGelap,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Get.to(register_screen()),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: Warna.warnaUtama,
                              ),
                              child: Center(
                                child: Text("Register",
                                    style: OpenSansRegular13.copyWith(
                                      fontSize: 16,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
