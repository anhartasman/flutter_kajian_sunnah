import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/helpers/resizer/fetch_pixels.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/widgets/cache_image_network.dart';

class PhotoUser extends StatelessWidget {
  final String? userId;
  final bool readOnly;
  final Color colorBg;
  final Color colorText;
  const PhotoUser({
    super.key,
    this.userId,
    this.readOnly = true,
    this.colorBg = Warna.hijau,
    this.colorText = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    final theUser = authService.theUser!;
    final photoURL = theUser.profil.avatar;
    debugPrint("photoURL $photoURL");
    final pecahanNama = theUser.profil.name.split(" ");
    final hurufPertama = pecahanNama[0].substring(0, 1);
    final hurufKedua =
        pecahanNama.length > 1 ? pecahanNama[1].substring(0, 1) : "";
    debugPrint("hurufPertama $hurufPertama");
    debugPrint("hurufKedua $hurufKedua");
    final namaPendek = hurufPertama + hurufKedua;
    if (photoURL.isNotEmpty) {
      return CircleAvatar(
        radius: FetchPixels.getPixelWidth(40),
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc"),
      );
    }
    return ClipOval(
      child: Container(
        width: FetchPixels.getPixelWidth(40),
        height: FetchPixels.getPixelHeight(40),
        decoration: BoxDecoration(color: colorBg, shape: BoxShape.circle),
        child: Center(
          child: Text(
            namaPendek,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
