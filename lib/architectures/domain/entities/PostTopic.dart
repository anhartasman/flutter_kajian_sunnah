import 'dart:convert';

class PostTopic {
  final String id;
  final String name;
  final String description;
  const PostTopic({
    required this.id,
    required this.name,
    required this.description,
  });

  factory PostTopic.defaultValue() {
    return const PostTopic(id: "", name: "", description: "");
  }

  PostTopic copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return PostTopic(
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

  factory PostTopic.fromMap(Map<String, dynamic> map) {
    return PostTopic(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostTopic.fromJson(String source) =>
      PostTopic.fromMap(json.decode(source));

  @override
  String toString() =>
      'PostTopic(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostTopic &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
