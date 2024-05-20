import 'package:flutter/material.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/HomeContent.dart';
import 'package:kajiansunnah/widgets/HomeHeader.dart';
import 'package:kajiansunnah/widgets/HomeTopic.dart';
import 'package:kajiansunnah/widgets/HomeUstadz.dart';
import 'package:kajiansunnah/widgets/PageBar.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return SafeArea(
      child: Column(
        children: [
          const PageBar(
            "Kajian Sunnah",
            homePage: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: HomeHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HomeTopic(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HomeUstadz(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HomeContent(PostCategory(
                      id: 1,
                      name: "Agenda",
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HomeContent(PostCategory(
                      id: 2,
                      name: "Artikel",
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HomeContent(PostCategory(
                      id: 3,
                      name: "Pengumuman",
                    )),
                  ),
                  SizedBox(
                    height: 32,
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
