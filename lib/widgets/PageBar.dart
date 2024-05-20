import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';

class PageBar extends StatelessWidget {
  final String title;
  final bool homePage;
  const PageBar(
    this.title, {
    Key? key,
    this.homePage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(16)),
      child: Row(
        children: [
          homePage
              ? InkWell(
                  onTap: () => BlocProvider.of<HomeNavBloc>(context)
                      .add(HomeNavOpenDrawer()),
                  child: SizedBox(
                    width: FetchPixels.getPixelWidth(50),
                    child: Icon(
                      Icons.grid_view,
                      color: Colors.black,
                    ),
                  ),
                )
              : InkWell(
                  onTap: () => Get.back(),
                  child: SizedBox(
                    width: FetchPixels.getPixelWidth(50),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
          Expanded(
            child: Text(
              title,
              style: OpenSansSemiBold10.copyWith(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: FetchPixels.getPixelWidth(50),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
