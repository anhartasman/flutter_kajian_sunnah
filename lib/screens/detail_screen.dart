import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/bloc/get_post_content/bloc.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';
import 'package:kajiansunnah/widgets/HomeContent.dart';
import 'package:kajiansunnah/widgets/HomeHeader.dart';
import 'package:kajiansunnah/widgets/HomeTopic.dart';
import 'package:kajiansunnah/widgets/HomeUstadz.dart';
import 'package:kajiansunnah/widgets/PageBar.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/widgets/PostItem.dart';
import 'package:shimmer/shimmer.dart';

class detail_screen extends StatelessWidget {
  final PostContent postContent;
  const detail_screen({
    super.key,
    required this.postContent,
  });

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageBar(postContent.category.name),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Container(
                    height: FetchPixels.getPixelHeight(260),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF80a1fd),
                          Color(0xFF4285F4),
                          Color(0xFF80a1fd),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      postContent.title,
                      style: ProzaLibreBold10.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      postContent.ustadzs[0].name,
                      style: OpenSansLight14.copyWith(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.asset("assets/icon/thumb.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            "785",
                            style: OpenSansSemiBold10.copyWith(
                              color: Warna.warnaUtama,
                            ),
                          ),
                        ),
                        Image.asset("assets/icon/lightning.png"),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text(
                              "1k+",
                              style: OpenSansSemiBold10.copyWith(
                                color: Warna.warnaAbuTeks,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      postContent.content,
                      style: OpenSansLight14.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
