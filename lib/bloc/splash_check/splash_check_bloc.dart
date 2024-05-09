import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/data/dataparser/ParserUserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserProfile.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetLoggedInUserUseCase.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';
import 'package:kajiansunnah/services/auth_service.dart';
import './bloc.dart';

class SplashCheckBloc extends Bloc<SplashCheckBlocEvent, SplashCheckBlocState> {
  final GetLoggedInUserUseCase getLoggedInUserUseCase;
  SplashCheckBloc({
    required this.getLoggedInUserUseCase,
  }) : super(SplashCheckOnIdle()) {
    on<SplashCheckBlocEvent>((event, emit) async {
      if (event is SplashCheckStart) {
        emit(SplashCheckOnAuth());

        final authService = Get.find<AuthService>();
        try {
          final failureOrTrivia = await getLoggedInUserUseCase(NoParams());

          final theData = await failureOrTrivia.first;

          authService.setIsLoggedIn(
            true,
            newUser: theData,
          );
        } catch (e) {
          authService.setIsLoggedIn(
            false,
          );
        }

        emit(SplashCheckOnSuccess(
          toWelcome: !authService.isLoggedIn,
        ));
      }
    });
  }
}
