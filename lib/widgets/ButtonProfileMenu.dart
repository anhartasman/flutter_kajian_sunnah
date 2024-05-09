import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';

class ButtonProfileMenu extends StatelessWidget {
  final String title;
  final String subtitle;
  const ButtonProfileMenu({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: OpenSansBold16,
                ),
                Text(
                  subtitle,
                  style: OpenSansRegular11.copyWith(
                    color: Warna.abuGelap,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black,
            size: 32,
          ),
        ],
      ),
    );
  }
}
