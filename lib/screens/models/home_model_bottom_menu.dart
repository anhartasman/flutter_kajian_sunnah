import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeModelBottomMenu {
  final String nama;
  final String iconImg;
  const HomeModelBottomMenu(this.nama, this.iconImg);
}

const List<HomeModelBottomMenu> bottomMenuList = [
  HomeModelBottomMenu(
    "Home",
    "Home.png",
  ),
  HomeModelBottomMenu(
    "Bookmark",
    "Bookmark.png",
  ),
  HomeModelBottomMenu(
    "Module",
    "Module.png",
  ),
  HomeModelBottomMenu(
    "Notification",
    "Notification.png",
  ),
  HomeModelBottomMenu(
    "Profile",
    "Profile.png",
  ),
];
