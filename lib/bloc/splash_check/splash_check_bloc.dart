import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/data/dataparser/ParserUserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserProfile.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import './bloc.dart';

class SplashCheckBloc extends Bloc<SplashCheckBlocEvent, SplashCheckBlocState> {
  SplashCheckBloc() : super(SplashCheckOnIdle()) {
    on<SplashCheckBlocEvent>((event, emit) async {
      if (event is SplashCheckStart) {
        emit(SplashCheckOnAuth());

        final authService = Get.find<AuthService>();
        authService.setIsLoggedIn(
          true,
          newUser: ParserUserAccount.createDefault(),
        );

        emit(SplashCheckOnSuccess());
      }
    });
  }
}
