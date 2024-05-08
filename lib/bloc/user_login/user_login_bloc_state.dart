import 'package:equatable/equatable.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';

abstract class UserLoginBlocState extends Equatable {
  const UserLoginBlocState();
  @override
  List<Object> get props => [];
}

class UserLoginBlocStateOnIdle extends UserLoginBlocState {
  const UserLoginBlocStateOnIdle();
}

class UserLoginBlocStateOnStarted extends UserLoginBlocState {}

class UserLoginBlocStateOnSuccess extends UserLoginBlocState {
  final UserAccount userAccount;
  const UserLoginBlocStateOnSuccess(this.userAccount);
}

class UserLoginBlocStateOnError extends UserLoginBlocState {
  final String email;
  final String password;
  final String errorMessage;
  UserLoginBlocStateOnError({
    required this.errorMessage,
    required this.email,
    required this.password,
  });
}
