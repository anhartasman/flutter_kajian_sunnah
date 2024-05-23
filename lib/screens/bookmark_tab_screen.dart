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

class bookmark_tab_screen extends StatefulWidget {
  const bookmark_tab_screen({super.key});

  @override
  State<bookmark_tab_screen> createState() => _bookmark_tab_screenState();
}

class _bookmark_tab_screenState extends State<bookmark_tab_screen>
    with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  late TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    return Scaffold(
      appBar: ReusableWidget.pageBar(
        context,
        title: "Bookmark",
        homePage: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                //This is for background color
                color: Colors.white.withOpacity(0.0),
                //This is for bottom border that is needed
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.8),
                ),
              ),
              child: new TabBar(
                controller: controller,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: <Widget>[
                  new Tab(
                    text: "Agenda",
                  ),
                  new Tab(
                    text: "Artikel",
                  ),
                  new Tab(
                    text: "Pengumuman",
                  ),
                ],
              ),
            ),
            Expanded(
              child: new TabBarView(
                //controller untuk tab bar
                controller: controller,
                children: <Widget>[
                  _bookmark_empty_screen(),
                  _bookmark_empty_screen(),
                  _bookmark_empty_screen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _bookmark_empty_screen extends StatelessWidget {
  const _bookmark_empty_screen({super.key});

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
                  Image.asset("assets/icon/BookmarkStar.png"),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Text(
                    "Whoopps..",
                    style: OpenSansBold16,
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    "You don’t have any bookmark",
                    style: OpenSansLight13.copyWith(
                      color: Warna.abuGelap,
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
