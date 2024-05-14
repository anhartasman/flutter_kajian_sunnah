import 'package:flutter/material.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
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
          PageBar("Kajian Sunnah"),
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
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 24.0,
                      bottom: 16,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              width: 2.0, color: Colors.lightBlue.shade600),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Mengenal Ustadz",
                        style: OpenSansSemiBold18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HomeUstadz(),
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
