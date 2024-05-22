import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';

class ReusableWidget {
  static AppBar pageBar<T>(
    BuildContext context, {
    required String title,
    bool homePage = false,
  }) {
    return AppBar(
      elevation: 0,
      title: Center(
        child: Text(
          title,
          style: OpenSansSemiBold10.copyWith(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      leading: homePage
          ? IconButton(
              icon: const Icon(
                Icons.grid_view,
                color: Colors.black,
              ),
              tooltip: 'Back',
              onPressed: () => BlocProvider.of<HomeNavBloc>(context)
                  .add(HomeNavOpenDrawer()),
            )
          : IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
              tooltip: 'Back',
              onPressed: () => Get.back(),
            ),
      actions: [
        SizedBox(
          width: 50,
          child: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
