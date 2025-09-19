// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'book_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookSearchApiResponse _$BookSearchApiResponseFromJson(
  Map<String, dynamic> json,
) => _BookSearchApiResponse(
  start: (json['start'] as num).toInt(),
  numFound: (json['num_found'] as num?)?.toInt(),
  docs:
      (json['docs'] as List<dynamic>?)
          ?.map((e) => BookPreview.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BookPreview>[],
);

Map<String, dynamic> _$BookSearchApiResponseToJson(
  _BookSearchApiResponse instance,
) => <String, dynamic>{
  'start': instance.start,
  'num_found': instance.numFound,
  'docs': instance.docs.map((e) => e.toJson()).toList(),
};

_BookPreview _$BookPreviewFromJson(Map<String, dynamic> json) => _BookPreview(
  coverI: (json['cover_i'] as num?)?.toInt(),
  hasFulltext: json['has_fulltext'] as bool?,
  editionCount: (json['edition_count'] as num?)?.toInt(),
  title: json['title'] as String,
  authorName:
      (json['author_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  firstPublishYear: (json['first_publish_year'] as num?)?.toInt(),
  key: json['key'] as String,
  ia:
      (json['ia'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  authorKey: (json['author_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publicScanB: json['public_scan_b'] as bool?,
);

Map<String, dynamic> _$BookPreviewToJson(_BookPreview instance) =>
    <String, dynamic>{
      'cover_i': instance.coverI,
      'has_fulltext': instance.hasFulltext,
      'edition_count': instance.editionCount,
      'title': instance.title,
      'author_name': instance.authorName,
      'first_publish_year': instance.firstPublishYear,
      'key': instance.key,
      'ia': instance.ia,
      'author_key': instance.authorKey,
      'public_scan_b': instance.publicScanB,
    };
