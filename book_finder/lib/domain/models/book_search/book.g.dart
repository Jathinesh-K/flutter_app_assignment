// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  key: json['key'] as String,
  title: json['title'] as String,
  authorName: json['author_name'] as String,
  coverImageId: json['cover_image_id'] as String,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'key': instance.key,
  'title': instance.title,
  'author_name': instance.authorName,
  'cover_image_id': instance.coverImageId,
};
