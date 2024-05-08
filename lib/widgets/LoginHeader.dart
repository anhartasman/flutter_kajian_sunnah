import 'package:flutter/material.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/colors/light_colors.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 24.0),
          child: Image.asset(
            "assets/images/splash_logo.png",
            height: 160,
          ),
        ),
        Text(
          "Kajian Sunnah",
          style: ProzaLibreExtraBold15.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(
            "Kini Mudah.",
            style: ProzaLibreExtraBold15.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
