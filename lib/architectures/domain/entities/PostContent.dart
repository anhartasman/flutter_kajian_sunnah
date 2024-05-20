import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';

class PostContent {
  final int id;
  final String title;
  final String slug;
  final String excerpt;
  final String content;
  final String status;
  final String image_url;
  final String view_count;
  final String like_count;
  final String dislike_count;
  final String bookmark_count;
  final String publish_date;
  final PostCategory category;
  final PostTopic topic;
  final List<String> tags;
  final List<UstadzProfile> ustadzs;
  final String created_by;
  final String updated_by;
  final String created_at;
  final String updated_at;
  final String created_at_ago;
  final String updated_at_ago;
  const PostContent({
    required this.id,
    this.title = '',
    this.slug = '',
    this.excerpt = '',
    this.content = '',
    this.status = '',
    this.image_url = '',
    this.view_count = '',
    this.like_count = '',
    this.dislike_count = '',
    this.bookmark_count = '',
    this.publish_date = '',
    required this.category,
    required this.topic,
    this.tags = const [],
    this.ustadzs = const [],
    this.created_by = '',
    this.updated_by = '',
    this.created_at = '',
    this.updated_at = '',
    this.created_at_ago = '',
    this.updated_at_ago = '',
  });

  PostContent copyWith({
    int? id,
    String? title,
    String? slug,
    String? excerpt,
    String? content,
    String? status,
    String? image_url,
    String? view_count,
    String? like_count,
    String? dislike_count,
    String? bookmark_count,
    String? publish_date,
    PostCategory? category,
    PostTopic? topic,
    List<String>? tags,
    List<UstadzProfile>? ustadzs,
    String? created_by,
    String? updated_by,
    String? created_at,
    String? updated_at,
    String? created_at_ago,
    String? updated_at_ago,
  }) {
    return PostContent(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      excerpt: excerpt ?? this.excerpt,
      content: content ?? this.content,
      status: status ?? this.status,
      image_url: image_url ?? this.image_url,
      view_count: view_count ?? this.view_count,
      like_count: like_count ?? this.like_count,
      dislike_count: dislike_count ?? this.dislike_count,
      bookmark_count: bookmark_count ?? this.bookmark_count,
      publish_date: publish_date ?? this.publish_date,
      category: category ?? this.category,
      topic: topic ?? this.topic,
      tags: tags ?? this.tags,
      ustadzs: ustadzs ?? this.ustadzs,
      created_by: created_by ?? this.created_by,
      updated_by: updated_by ?? this.updated_by,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      created_at_ago: created_at_ago ?? this.created_at_ago,
      updated_at_ago: updated_at_ago ?? this.updated_at_ago,
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
      'image_url': image_url,
      'view_count': view_count,
      'like_count': like_count,
      'dislike_count': dislike_count,
      'bookmark_count': bookmark_count,
      'publish_date': publish_date,
      'category': category.toMap(),
      'topic': topic.toMap(),
      'tags': tags,
      'ustadzs': ustadzs.map((x) => x.toMap()).toList(),
      'created_by': created_by,
      'updated_by': updated_by,
      'created_at': created_at,
      'updated_at': updated_at,
      'created_at_ago': created_at_ago,
      'updated_at_ago': updated_at_ago,
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
      image_url: map['image_url'] ?? '',
      view_count: map['view_count'] ?? '',
      like_count: map['like_count'] ?? '',
      dislike_count: map['dislike_count'] ?? '',
      bookmark_count: map['bookmark_count'] ?? '',
      publish_date: map['publish_date'] ?? '',
      category: PostCategory.fromMap(map['category']),
      topic: PostTopic.fromMap(map['topic']),
      tags: List<String>.from(map['tags']),
      ustadzs: List<UstadzProfile>.from(
          map['ustadzs']?.map((x) => UstadzProfile.fromMap(x))),
      created_by: map['created_by'] ?? '',
      updated_by: map['updated_by'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      created_at_ago: map['created_at_ago'] ?? '',
      updated_at_ago: map['updated_at_ago'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostContent.fromJson(String source) =>
      PostContent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostContent(id: $id, title: $title, slug: $slug, excerpt: $excerpt, content: $content, status: $status, image_url: $image_url, view_count: $view_count, like_count: $like_count, dislike_count: $dislike_count, bookmark_count: $bookmark_count, publish_date: $publish_date, category: $category, topic: $topic, tags: $tags, ustadzs: $ustadzs, created_by: $created_by, updated_by: $updated_by, created_at: $created_at, updated_at: $updated_at, created_at_ago: $created_at_ago, updated_at_ago: $updated_at_ago)';
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
        other.image_url == image_url &&
        other.view_count == view_count &&
        other.like_count == like_count &&
        other.dislike_count == dislike_count &&
        other.bookmark_count == bookmark_count &&
        other.publish_date == publish_date &&
        other.category == category &&
        other.topic == topic &&
        listEquals(other.tags, tags) &&
        listEquals(other.ustadzs, ustadzs) &&
        other.created_by == created_by &&
        other.updated_by == updated_by &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.created_at_ago == created_at_ago &&
        other.updated_at_ago == updated_at_ago;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        slug.hashCode ^
        excerpt.hashCode ^
        content.hashCode ^
        status.hashCode ^
        image_url.hashCode ^
        view_count.hashCode ^
        like_count.hashCode ^
        dislike_count.hashCode ^
        bookmark_count.hashCode ^
        publish_date.hashCode ^
        category.hashCode ^
        topic.hashCode ^
        tags.hashCode ^
        ustadzs.hashCode ^
        created_by.hashCode ^
        updated_by.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        created_at_ago.hashCode ^
        updated_at_ago.hashCode;
  }
}
