import 'package:equatable/equatable.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';

abstract class UserRegisterBlocState extends Equatable {
  const UserRegisterBlocState();
  @override
  List<Object> get props => [];
}

class UserRegisterBlocStateOnIdle extends UserRegisterBlocState {
  const UserRegisterBlocStateOnIdle();
}

class UserRegisterBlocStateOnStarted extends UserRegisterBlocState {}

class UserRegisterBlocStateOnSuccess extends UserRegisterBlocState {}

class UserRegisterBlocStateOnError extends UserRegisterBlocState {
  final UserRegistration userRegistration;
  final String errorMessage;
  UserRegisterBlocStateOnError({
    required this.errorMessage,
    required this.userRegistration,
  });
}
