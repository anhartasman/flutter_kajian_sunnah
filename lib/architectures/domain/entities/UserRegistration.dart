import 'dart:convert';

class UserRegistration {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String gender;
  final String address;
  const UserRegistration({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.gender,
    required this.address,
  });

  UserRegistration copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    String? gender,
    String? address,
  }) {
    return UserRegistration(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'gender': gender,
      'address': address,
    };
  }

  factory UserRegistration.fromMap(Map<String, dynamic> map) {
    return UserRegistration(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['confirmPassword'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRegistration.fromJson(String source) =>
      UserRegistration.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserRegistration(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, phone: $phone, gender: $gender, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRegistration &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.phone == phone &&
        other.gender == gender &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        address.hashCode;
  }
}
