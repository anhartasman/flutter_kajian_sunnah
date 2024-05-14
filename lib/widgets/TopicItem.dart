import 'package:flutter/material.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/colors/light_colors.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';

class TopicItem extends StatelessWidget {
  final String title;
  const TopicItem(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelHeight(16),
        vertical: FetchPixels.getPixelHeight(8),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        color: Warna.warnaAbu.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 20, offset: const Offset(0, -2)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 15,
            height: 15,
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              style: OpenSansRegular14.copyWith(
                color: Warna.tag,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
