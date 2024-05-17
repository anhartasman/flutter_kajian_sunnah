import 'dart:convert';

class PostCategory {
  final int id;
  final String name;
  final String description;
  const PostCategory({
    required this.id,
    required this.name,
    this.description = '',
  });

  PostCategory copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return PostCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory PostCategory.fromMap(Map<String, dynamic> map) {
    return PostCategory(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostCategory.fromJson(String source) =>
      PostCategory.fromMap(json.decode(source));

  @override
  String toString() =>
      'PostCategory(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostCategory &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
