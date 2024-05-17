import 'package:flutter/material.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:kajiansunnah/helpers/colors/color_data.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/colors/light_colors.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/theme/styles/text/prozalibre_style_text.dart';

class UstadzItem extends StatelessWidget {
  final UstadzProfile profile;
  const UstadzItem(this.profile, {super.key});
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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  profile.name,
                  style: OpenSansSemiBold12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: SizedBox(
                  width: 150,
                  child: Text(
                    profile.short_bio,
                    style: OpenSansRegular11.copyWith(
                      color: Warna.tag,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(
              horizontal: FetchPixels.getPixelHeight(16),
              vertical: FetchPixels.getPixelHeight(8),
            ),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),
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
                "Lihat Profile",
                style: OpenSansRegular14.copyWith(
                  fontSize: 10,
                  color: Warna.tag,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
