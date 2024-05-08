import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:kajiansunnah/screens/login/login_screen.dart';
import 'package:kajiansunnah/screens/register/register_screen.dart';
import 'package:kajiansunnah/services/size_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';
import 'package:kajiansunnah/widgets/LoginHeader.dart';

class welcome_screen extends StatelessWidget {
  const welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF80a1fd),
            Color(0xFF4285F4),
            Color(0xFF80a1fd),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              LoginHeader(),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  SPLASH_APP_TEXT,
                  style: OpenSansSemiBold16.copyWith(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () => Get.to(register_screen()),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text("Create an account",
                        style: OpenSansRegular13.copyWith(
                          fontSize: 16,
                          color: Warna.warnaUtama,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.to(login_screen()),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Warna.warnaUtama,
                  ),
                  child: Center(
                    child: Text("Login",
                        style: OpenSansRegular13.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Color(0xFF4285F4),
                      ],
                    )),
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 24.0),
                child: Text(
                  "Continue without sign in",
                  style: OpenSansSemiBold14.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void quitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
