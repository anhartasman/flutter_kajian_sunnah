import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';

abstract class UserRegisterBlocEvent {}

class UserRegisterBlocStart extends UserRegisterBlocEvent {
  final UserRegistration userRegistration;
  UserRegisterBlocStart({required this.userRegistration});
}
