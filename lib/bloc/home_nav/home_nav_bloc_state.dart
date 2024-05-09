// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeNavBlocState extends Equatable {
  final int menuActive;
  final bool openDrawer;
  final bool logout;
  const HomeNavBlocState({
    this.menuActive = -1,
    this.openDrawer = false,
    this.logout = false,
  });

  HomeNavBlocState copyWith({
    int? menuActive,
    bool? openDrawer,
    bool? logout,
  }) {
    return HomeNavBlocState(
      menuActive: menuActive ?? this.menuActive,
      openDrawer: openDrawer ?? this.openDrawer,
      logout: logout ?? this.logout,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'menuActive': menuActive,
      'openDrawer': openDrawer,
      'logout': logout,
    };
  }

  factory HomeNavBlocState.fromMap(Map<String, dynamic> map) {
    return HomeNavBlocState(
      menuActive: map['menuActive']?.toInt() ?? 0,
      openDrawer: map['openDrawer'] ?? false,
      logout: map['logout'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeNavBlocState.fromJson(String source) =>
      HomeNavBlocState.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [menuActive, openDrawer, logout];

  @override
  String toString() =>
      'HomeNavBlocState(menuActive: $menuActive, openDrawer: $openDrawer, logout: $logout)';
}
