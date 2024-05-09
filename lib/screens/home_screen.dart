import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/navbar/HomeNavBar.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(16)),
            child: Row(
              children: [
                InkWell(
                  onTap: () => BlocProvider.of<HomeNavBloc>(context)
                      .add(HomeNavOpenDrawer()),
                  child: SizedBox(
                    width: FetchPixels.getPixelWidth(50),
                    child: Icon(
                      Icons.grid_view,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Kajian Sunnah",
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
          ),
        ],
      ),
    );
  }
}
