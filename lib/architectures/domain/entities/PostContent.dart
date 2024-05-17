import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';

class PostContent {
  final int id;
  final String title;
  final String slug;
  final String excerpt;
  final String content;
  final String status;
  final String imageUrl;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String bookmarkCount;
  final String publishDate;
  final PostCategory category;
  final PostTopic topic;
  final List<String> tags;
  final String createdBy;
  final String updatedBy;
  final String createdAt;
  final String updatedAt;
  final String createdAtAgo;
  final String updatedAtAgo;
  const PostContent({
    required this.id,
    this.title = '',
    this.slug = '',
    this.excerpt = '',
    this.content = '',
    this.status = '',
    this.imageUrl = '',
    this.viewCount = '',
    this.likeCount = '',
    this.dislikeCount = '',
    this.bookmarkCount = '',
    this.publishDate = '',
    required this.category,
    required this.topic,
    this.tags = const [],
    this.createdBy = '',
    this.updatedBy = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.createdAtAgo = '',
    this.updatedAtAgo = '',
  });

  PostContent copyWith({
    int? id,
    String? title,
    String? slug,
    String? excerpt,
    String? content,
    String? status,
    String? imageUrl,
    String? viewCount,
    String? likeCount,
    String? dislikeCount,
    String? bookmarkCount,
    String? publishDate,
    PostCategory? category,
    PostTopic? topic,
    List<String>? tags,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? createdAtAgo,
    String? updatedAtAgo,
  }) {
    return PostContent(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      excerpt: excerpt ?? this.excerpt,
      content: content ?? this.content,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      bookmarkCount: bookmarkCount ?? this.bookmarkCount,
      publishDate: publishDate ?? this.publishDate,
      category: category ?? this.category,
      topic: topic ?? this.topic,
      tags: tags ?? this.tags,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAtAgo: createdAtAgo ?? this.createdAtAgo,
      updatedAtAgo: updatedAtAgo ?? this.updatedAtAgo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'excerpt': excerpt,
      'content': content,
      'status': status,
      'imageUrl': imageUrl,
      'viewCount': viewCount,
      'likeCount': likeCount,
      'dislikeCount': dislikeCount,
      'bookmarkCount': bookmarkCount,
      'publishDate': publishDate,
      'category': category.toMap(),
      'topic': topic.toMap(),
      'tags': tags,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdAtAgo': createdAtAgo,
      'updatedAtAgo': updatedAtAgo,
    };
  }

  factory PostContent.fromMap(Map<String, dynamic> map) {
    return PostContent(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      slug: map['slug'] ?? '',
      excerpt: map['excerpt'] ?? '',
      content: map['content'] ?? '',
      status: map['status'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      viewCount: map['viewCount'] ?? '',
      likeCount: map['likeCount'] ?? '',
      dislikeCount: map['dislikeCount'] ?? '',
      bookmarkCount: map['bookmarkCount'] ?? '',
      publishDate: map['publishDate'] ?? '',
      category: PostCategory.fromMap(map['category']),
      topic: PostTopic.fromMap(map['topic']),
      tags: List<String>.from(map['tags']),
      createdBy: map['createdBy'] ?? '',
      updatedBy: map['updatedBy'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      createdAtAgo: map['createdAtAgo'] ?? '',
      updatedAtAgo: map['updatedAtAgo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostContent.fromJson(String source) =>
      PostContent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostContent(id: $id, title: $title, slug: $slug, excerpt: $excerpt, content: $content, status: $status, imageUrl: $imageUrl, viewCount: $viewCount, likeCount: $likeCount, dislikeCount: $dislikeCount, bookmarkCount: $bookmarkCount, publishDate: $publishDate, category: $category, topic: $topic, tags: $tags, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, createdAtAgo: $createdAtAgo, updatedAtAgo: $updatedAtAgo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostContent &&
        other.id == id &&
        other.title == title &&
        other.slug == slug &&
        other.excerpt == excerpt &&
        other.content == content &&
        other.status == status &&
        other.imageUrl == imageUrl &&
        other.viewCount == viewCount &&
        other.likeCount == likeCount &&
        other.dislikeCount == dislikeCount &&
        other.bookmarkCount == bookmarkCount &&
        other.publishDate == publishDate &&
        other.category == category &&
        other.topic == topic &&
        listEquals(other.tags, tags) &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.createdAtAgo == createdAtAgo &&
        other.updatedAtAgo == updatedAtAgo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        slug.hashCode ^
        excerpt.hashCode ^
        content.hashCode ^
        status.hashCode ^
        imageUrl.hashCode ^
        viewCount.hashCode ^
        likeCount.hashCode ^
        dislikeCount.hashCode ^
        bookmarkCount.hashCode ^
        publishDate.hashCode ^
        category.hashCode ^
        topic.hashCode ^
        tags.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        createdAtAgo.hashCode ^
        updatedAtAgo.hashCode;
  }
}
