import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';
import 'package:kajiansunnah/widgets/PageBar.dart';
import 'package:kajiansunnah/widgets/navbar/HomeNavBar.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return SafeArea(
      child: Column(
        children: [
          PageBar("Kajian Sunnah"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelHeight(20),
                      vertical: FetchPixels.getPixelHeight(16),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Warna.warnaUtama,
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor,
                            blurRadius: 20,
                            offset: const Offset(0, -2)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child:
                                    Image.asset("assets/images/bookHome.png")),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Temukan Jadwal Kajian",
                                  style: ProzaLibreSemiBold16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Dengan Mudah",
                                  style: ProzaLibreSemiBold16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16.0),
                          child: TextField(
                            style: OpenSansRegular11,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 28,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 12,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: OpenSansRegular14.copyWith(
                                color: Colors.grey,
                              ),
                              hintText: "apa yang kamu cari?",
                              fillColor: Colors.white,
                              isDense: true,
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
