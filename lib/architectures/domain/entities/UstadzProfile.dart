import 'dart:convert';

class UstadzProfile {
  final String id;
  final String name;
  final String short_bio;
  final String description;
  const UstadzProfile({
    required this.id,
    required this.name,
    required this.short_bio,
    required this.description,
  });

  factory UstadzProfile.defaultValue() {
    return const UstadzProfile(
      id: "",
      name: "",
      short_bio: "",
      description: "",
    );
  }

  UstadzProfile copyWith({
    String? id,
    String? name,
    String? short_bio,
    String? description,
  }) {
    return UstadzProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      short_bio: short_bio ?? this.short_bio,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'short_bio': short_bio,
      'description': description,
    };
  }

  factory UstadzProfile.fromMap(Map<String, dynamic> map) {
    return UstadzProfile(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      short_bio: map['short_bio'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UstadzProfile.fromJson(String source) =>
      UstadzProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UstadzProfile(id: $id, name: $name, short_bio: $short_bio, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UstadzProfile &&
        other.id == id &&
        other.name == name &&
        other.short_bio == short_bio &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        short_bio.hashCode ^
        description.hashCode;
  }
}
