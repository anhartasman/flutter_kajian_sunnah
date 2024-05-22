import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/ButtonProfileMenu.dart';
import 'package:kajiansunnah/widgets/PhotoUser.dart';
import 'package:kajiansunnah/widgets/TampilanDialog.dart';
import 'package:kajiansunnah/widgets/reusables/ReusableWidget.dart';

class ustadz_screen extends StatelessWidget {
  final UstadzProfile ustadzProfile;
  const ustadz_screen(this.ustadzProfile, {super.key});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      appBar: ReusableWidget.pageBar(
        context,
        title: "Profile Ustadz",
      ),
      body: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: statusBarHeight),
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
                    Container(
                      width: 65,
                      height: 65,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF80a1fd),
                            Color(0xFF4285F4),
                            Color(0xFF80a1fd),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            ustadzProfile.name,
                            style: OpenSansSemiBold14,
                          ),
                          Padding(padding: EdgeInsets.only(top: 2)),
                          Text(
                            ustadzProfile.short_bio,
                            style: OpenSansLight11.copyWith(
                              color: Warna.abuGelap,
                              fontSize: 13,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 8),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: FetchPixels.getPixelHeight(16),
                                    vertical: FetchPixels.getPixelHeight(8),
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
                                      "Ikuti",
                                      style: OpenSansRegular14.copyWith(
                                        fontSize: 10,
                                        color: Warna.abuGelap,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Short Bio",
                      style: OpenSansSemiBold14,
                    ),
                    Padding(padding: EdgeInsets.only(top: 2)),
                    Text(
                      ustadzProfile.description,
                      style: OpenSansLight11.copyWith(
                        color: Warna.abuGelap,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
