import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/colors/light_colors.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';

class PostItem extends StatelessWidget {
  final PostContent postContent;
  const PostItem(this.postContent, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: FetchPixels.getPixelWidth(200),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: FetchPixels.getPixelWidth(200),
            height: FetchPixels.getPixelHeight(160),
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: FetchPixels.getPixelHeight(16),
              vertical: FetchPixels.getPixelHeight(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    postContent.title,
                    style: OpenSansSemiBold12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    postContent.excerpt,
                    style: OpenSansRegular11.copyWith(
                      color: Warna.tag,
                    ),
                  ),
                ),
                Row(
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
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: FetchPixels.getPixelHeight(8),
                        vertical: FetchPixels.getPixelHeight(8),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        color: Warna.warnaUtama.withOpacity(0.5),
                        boxShadow: [
                          BoxShadow(
                              color: shadowColor,
                              blurRadius: 20,
                              offset: const Offset(0, -2)),
                        ],
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.bookmark,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
