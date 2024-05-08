import 'dart:convert';

class UserProfile {
  final String id;
  final String uuid;
  final String name;
  final String address;
  final String phone;
  final String gender;
  final String avatar;
  const UserProfile({
    required this.id,
    required this.uuid,
    required this.name,
    required this.address,
    required this.phone,
    required this.gender,
    required this.avatar,
  });

  UserProfile copyWith({
    String? id,
    String? uuid,
    String? name,
    String? address,
    String? phone,
    String? gender,
    String? avatar,
  }) {
    return UserProfile(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'address': address,
      'phone': phone,
      'gender': gender,
      'avatar': avatar,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] ?? '',
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(id: $id, uuid: $uuid, name: $name, address: $address, phone: $phone, gender: $gender, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfile &&
        other.id == id &&
        other.uuid == uuid &&
        other.name == name &&
        other.address == address &&
        other.phone == phone &&
        other.gender == gender &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        name.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        avatar.hashCode;
  }
}
