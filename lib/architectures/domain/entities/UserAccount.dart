import 'dart:convert';

import 'UserProfile.dart';

/// A user of the application.
class UserAccount {
  final String id;

  final String email;

  final String token;

  final UserProfile profil;

  const UserAccount({
    required this.id,
    required this.email,
    required this.token,
    required this.profil,
  });

  UserAccount copyWith({
    String? id,
    String? email,
    String? token,
    UserProfile? profil,
  }) {
    return UserAccount(
      id: id ?? this.id,
      email: email ?? this.email,
      token: token ?? this.token,
      profil: profil ?? this.profil,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'token': token,
      'profil': profil.toMap(),
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      profil: UserProfile.fromMap(map['profil']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserAccount(id: $id, email: $email, token: $token, profil: $profil)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAccount &&
        other.id == id &&
        other.email == email &&
        other.token == token &&
        other.profil == profil;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ token.hashCode ^ profil.hashCode;
  }
}
