abstract class UserLoginBlocEvent {}

class UserLoginBlocStart extends UserLoginBlocEvent {
  final String email;
  final String password;
  UserLoginBlocStart({required this.email, required this.password});
}
