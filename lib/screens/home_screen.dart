import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/HomeContent.dart';
import 'package:kajiansunnah/widgets/HomeHeader.dart';
import 'package:kajiansunnah/widgets/HomeTopic.dart';
import 'package:kajiansunnah/widgets/HomeUstadz.dart';
import 'package:kajiansunnah/widgets/PageBar.dart';
import 'package:kajiansunnah/widgets/reusables/ReusableWidget.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      appBar: ReusableWidget.pageBar(
        context,
        title: "Kajian Sunnah",
        homePage: true,
      ),
      body: SafeArea(
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
    );
  }
}
