import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_search_model.freezed.dart';
part 'book_search_model.g.dart';

@freezed
abstract class BookSearchApiResponse with _$BookSearchApiResponse {
  const factory BookSearchApiResponse({
    required int start,
    int? numFound,
    @Default(<BookPreview>[]) List<BookPreview> docs,
  }) = _BookSearchApiResponse;

  factory BookSearchApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BookSearchApiResponseFromJson(json);
}

@freezed
abstract class BookPreview with _$BookPreview {
  const factory BookPreview({
    int? coverI,
    bool? hasFulltext,
    int? editionCount,
    required String title,
    @Default(<String>[]) List<String> authorName,
    int? firstPublishYear,
    required String key,
    @Default(<String>[]) List<String> ia,
    List<String>? authorKey,
    bool? publicScanB,
  }) = _BookPreview;

  factory BookPreview.fromJson(Map<String, dynamic> json) =>
      _$BookPreviewFromJson(json);
}
