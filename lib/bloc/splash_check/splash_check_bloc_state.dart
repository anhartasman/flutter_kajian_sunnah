import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class SplashCheckBlocState extends Equatable {
  const SplashCheckBlocState();
  @override
  List<Object> get props => [];
}

class SplashCheckOnIdle extends SplashCheckBlocState {
  const SplashCheckOnIdle();
}

class SplashCheckOnAuth extends SplashCheckBlocState {}

class SplashCheckOnSuccess extends SplashCheckBlocState {
  final bool toWelcome;
  const SplashCheckOnSuccess({this.toWelcome = true});
}
