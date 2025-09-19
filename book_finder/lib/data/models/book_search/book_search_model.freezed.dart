// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookSearchApiResponse {

 int get start; int? get numFound; List<BookPreview> get docs;
/// Create a copy of BookSearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSearchApiResponseCopyWith<BookSearchApiResponse> get copyWith => _$BookSearchApiResponseCopyWithImpl<BookSearchApiResponse>(this as BookSearchApiResponse, _$identity);

  /// Serializes this BookSearchApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSearchApiResponse&&(identical(other.start, start) || other.start == start)&&(identical(other.numFound, numFound) || other.numFound == numFound)&&const DeepCollectionEquality().equals(other.docs, docs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,numFound,const DeepCollectionEquality().hash(docs));

@override
String toString() {
  return 'BookSearchApiResponse(start: $start, numFound: $numFound, docs: $docs)';
}


}

/// @nodoc
abstract mixin class $BookSearchApiResponseCopyWith<$Res>  {
  factory $BookSearchApiResponseCopyWith(BookSearchApiResponse value, $Res Function(BookSearchApiResponse) _then) = _$BookSearchApiResponseCopyWithImpl;
@useResult
$Res call({
 int start, int? numFound, List<BookPreview> docs
});




}
/// @nodoc
class _$BookSearchApiResponseCopyWithImpl<$Res>
    implements $BookSearchApiResponseCopyWith<$Res> {
  _$BookSearchApiResponseCopyWithImpl(this._self, this._then);

  final BookSearchApiResponse _self;
  final $Res Function(BookSearchApiResponse) _then;

/// Create a copy of BookSearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? numFound = freezed,Object? docs = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,numFound: freezed == numFound ? _self.numFound : numFound // ignore: cast_nullable_to_non_nullable
as int?,docs: null == docs ? _self.docs : docs // ignore: cast_nullable_to_non_nullable
as List<BookPreview>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookSearchApiResponse].
extension BookSearchApiResponsePatterns on BookSearchApiResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookSearchApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookSearchApiResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookSearchApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookSearchApiResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookSearchApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookSearchApiResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int start,  int? numFound,  List<BookPreview> docs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookSearchApiResponse() when $default != null:
return $default(_that.start,_that.numFound,_that.docs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int start,  int? numFound,  List<BookPreview> docs)  $default,) {final _that = this;
switch (_that) {
case _BookSearchApiResponse():
return $default(_that.start,_that.numFound,_that.docs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int start,  int? numFound,  List<BookPreview> docs)?  $default,) {final _that = this;
switch (_that) {
case _BookSearchApiResponse() when $default != null:
return $default(_that.start,_that.numFound,_that.docs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookSearchApiResponse implements BookSearchApiResponse {
  const _BookSearchApiResponse({required this.start, this.numFound, final  List<BookPreview> docs = const <BookPreview>[]}): _docs = docs;
  factory _BookSearchApiResponse.fromJson(Map<String, dynamic> json) => _$BookSearchApiResponseFromJson(json);

@override final  int start;
@override final  int? numFound;
 final  List<BookPreview> _docs;
@override@JsonKey() List<BookPreview> get docs {
  if (_docs is EqualUnmodifiableListView) return _docs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_docs);
}


/// Create a copy of BookSearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookSearchApiResponseCopyWith<_BookSearchApiResponse> get copyWith => __$BookSearchApiResponseCopyWithImpl<_BookSearchApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookSearchApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookSearchApiResponse&&(identical(other.start, start) || other.start == start)&&(identical(other.numFound, numFound) || other.numFound == numFound)&&const DeepCollectionEquality().equals(other._docs, _docs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,numFound,const DeepCollectionEquality().hash(_docs));

@override
String toString() {
  return 'BookSearchApiResponse(start: $start, numFound: $numFound, docs: $docs)';
}


}

/// @nodoc
abstract mixin class _$BookSearchApiResponseCopyWith<$Res> implements $BookSearchApiResponseCopyWith<$Res> {
  factory _$BookSearchApiResponseCopyWith(_BookSearchApiResponse value, $Res Function(_BookSearchApiResponse) _then) = __$BookSearchApiResponseCopyWithImpl;
@override @useResult
$Res call({
 int start, int? numFound, List<BookPreview> docs
});




}
/// @nodoc
class __$BookSearchApiResponseCopyWithImpl<$Res>
    implements _$BookSearchApiResponseCopyWith<$Res> {
  __$BookSearchApiResponseCopyWithImpl(this._self, this._then);

  final _BookSearchApiResponse _self;
  final $Res Function(_BookSearchApiResponse) _then;

/// Create a copy of BookSearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? numFound = freezed,Object? docs = null,}) {
  return _then(_BookSearchApiResponse(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,numFound: freezed == numFound ? _self.numFound : numFound // ignore: cast_nullable_to_non_nullable
as int?,docs: null == docs ? _self._docs : docs // ignore: cast_nullable_to_non_nullable
as List<BookPreview>,
  ));
}


}


/// @nodoc
mixin _$BookPreview {

 int? get coverI; bool? get hasFulltext; int? get editionCount; String get title; List<String> get authorName; int? get firstPublishYear; String get key; List<String> get ia; List<String>? get authorKey; bool? get publicScanB;
/// Create a copy of BookPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookPreviewCopyWith<BookPreview> get copyWith => _$BookPreviewCopyWithImpl<BookPreview>(this as BookPreview, _$identity);

  /// Serializes this BookPreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookPreview&&(identical(other.coverI, coverI) || other.coverI == coverI)&&(identical(other.hasFulltext, hasFulltext) || other.hasFulltext == hasFulltext)&&(identical(other.editionCount, editionCount) || other.editionCount == editionCount)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.authorName, authorName)&&(identical(other.firstPublishYear, firstPublishYear) || other.firstPublishYear == firstPublishYear)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.ia, ia)&&const DeepCollectionEquality().equals(other.authorKey, authorKey)&&(identical(other.publicScanB, publicScanB) || other.publicScanB == publicScanB));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverI,hasFulltext,editionCount,title,const DeepCollectionEquality().hash(authorName),firstPublishYear,key,const DeepCollectionEquality().hash(ia),const DeepCollectionEquality().hash(authorKey),publicScanB);

@override
String toString() {
  return 'BookPreview(coverI: $coverI, hasFulltext: $hasFulltext, editionCount: $editionCount, title: $title, authorName: $authorName, firstPublishYear: $firstPublishYear, key: $key, ia: $ia, authorKey: $authorKey, publicScanB: $publicScanB)';
}


}

/// @nodoc
abstract mixin class $BookPreviewCopyWith<$Res>  {
  factory $BookPreviewCopyWith(BookPreview value, $Res Function(BookPreview) _then) = _$BookPreviewCopyWithImpl;
@useResult
$Res call({
 int? coverI, bool? hasFulltext, int? editionCount, String title, List<String> authorName, int? firstPublishYear, String key, List<String> ia, List<String>? authorKey, bool? publicScanB
});




}
/// @nodoc
class _$BookPreviewCopyWithImpl<$Res>
    implements $BookPreviewCopyWith<$Res> {
  _$BookPreviewCopyWithImpl(this._self, this._then);

  final BookPreview _self;
  final $Res Function(BookPreview) _then;

/// Create a copy of BookPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coverI = freezed,Object? hasFulltext = freezed,Object? editionCount = freezed,Object? title = null,Object? authorName = null,Object? firstPublishYear = freezed,Object? key = null,Object? ia = null,Object? authorKey = freezed,Object? publicScanB = freezed,}) {
  return _then(_self.copyWith(
coverI: freezed == coverI ? _self.coverI : coverI // ignore: cast_nullable_to_non_nullable
as int?,hasFulltext: freezed == hasFulltext ? _self.hasFulltext : hasFulltext // ignore: cast_nullable_to_non_nullable
as bool?,editionCount: freezed == editionCount ? _self.editionCount : editionCount // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as List<String>,firstPublishYear: freezed == firstPublishYear ? _self.firstPublishYear : firstPublishYear // ignore: cast_nullable_to_non_nullable
as int?,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,ia: null == ia ? _self.ia : ia // ignore: cast_nullable_to_non_nullable
as List<String>,authorKey: freezed == authorKey ? _self.authorKey : authorKey // ignore: cast_nullable_to_non_nullable
as List<String>?,publicScanB: freezed == publicScanB ? _self.publicScanB : publicScanB // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookPreview].
extension BookPreviewPatterns on BookPreview {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookPreview() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookPreview value)  $default,){
final _that = this;
switch (_that) {
case _BookPreview():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookPreview value)?  $default,){
final _that = this;
switch (_that) {
case _BookPreview() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? coverI,  bool? hasFulltext,  int? editionCount,  String title,  List<String> authorName,  int? firstPublishYear,  String key,  List<String> ia,  List<String>? authorKey,  bool? publicScanB)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookPreview() when $default != null:
return $default(_that.coverI,_that.hasFulltext,_that.editionCount,_that.title,_that.authorName,_that.firstPublishYear,_that.key,_that.ia,_that.authorKey,_that.publicScanB);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? coverI,  bool? hasFulltext,  int? editionCount,  String title,  List<String> authorName,  int? firstPublishYear,  String key,  List<String> ia,  List<String>? authorKey,  bool? publicScanB)  $default,) {final _that = this;
switch (_that) {
case _BookPreview():
return $default(_that.coverI,_that.hasFulltext,_that.editionCount,_that.title,_that.authorName,_that.firstPublishYear,_that.key,_that.ia,_that.authorKey,_that.publicScanB);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? coverI,  bool? hasFulltext,  int? editionCount,  String title,  List<String> authorName,  int? firstPublishYear,  String key,  List<String> ia,  List<String>? authorKey,  bool? publicScanB)?  $default,) {final _that = this;
switch (_that) {
case _BookPreview() when $default != null:
return $default(_that.coverI,_that.hasFulltext,_that.editionCount,_that.title,_that.authorName,_that.firstPublishYear,_that.key,_that.ia,_that.authorKey,_that.publicScanB);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookPreview implements BookPreview {
  const _BookPreview({this.coverI, this.hasFulltext, this.editionCount, required this.title, final  List<String> authorName = const <String>[], this.firstPublishYear, required this.key, final  List<String> ia = const <String>[], final  List<String>? authorKey, this.publicScanB}): _authorName = authorName,_ia = ia,_authorKey = authorKey;
  factory _BookPreview.fromJson(Map<String, dynamic> json) => _$BookPreviewFromJson(json);

@override final  int? coverI;
@override final  bool? hasFulltext;
@override final  int? editionCount;
@override final  String title;
 final  List<String> _authorName;
@override@JsonKey() List<String> get authorName {
  if (_authorName is EqualUnmodifiableListView) return _authorName;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authorName);
}

@override final  int? firstPublishYear;
@override final  String key;
 final  List<String> _ia;
@override@JsonKey() List<String> get ia {
  if (_ia is EqualUnmodifiableListView) return _ia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ia);
}

 final  List<String>? _authorKey;
@override List<String>? get authorKey {
  final value = _authorKey;
  if (value == null) return null;
  if (_authorKey is EqualUnmodifiableListView) return _authorKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? publicScanB;

/// Create a copy of BookPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookPreviewCopyWith<_BookPreview> get copyWith => __$BookPreviewCopyWithImpl<_BookPreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookPreviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookPreview&&(identical(other.coverI, coverI) || other.coverI == coverI)&&(identical(other.hasFulltext, hasFulltext) || other.hasFulltext == hasFulltext)&&(identical(other.editionCount, editionCount) || other.editionCount == editionCount)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._authorName, _authorName)&&(identical(other.firstPublishYear, firstPublishYear) || other.firstPublishYear == firstPublishYear)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other._ia, _ia)&&const DeepCollectionEquality().equals(other._authorKey, _authorKey)&&(identical(other.publicScanB, publicScanB) || other.publicScanB == publicScanB));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverI,hasFulltext,editionCount,title,const DeepCollectionEquality().hash(_authorName),firstPublishYear,key,const DeepCollectionEquality().hash(_ia),const DeepCollectionEquality().hash(_authorKey),publicScanB);

@override
String toString() {
  return 'BookPreview(coverI: $coverI, hasFulltext: $hasFulltext, editionCount: $editionCount, title: $title, authorName: $authorName, firstPublishYear: $firstPublishYear, key: $key, ia: $ia, authorKey: $authorKey, publicScanB: $publicScanB)';
}


}

/// @nodoc
abstract mixin class _$BookPreviewCopyWith<$Res> implements $BookPreviewCopyWith<$Res> {
  factory _$BookPreviewCopyWith(_BookPreview value, $Res Function(_BookPreview) _then) = __$BookPreviewCopyWithImpl;
@override @useResult
$Res call({
 int? coverI, bool? hasFulltext, int? editionCount, String title, List<String> authorName, int? firstPublishYear, String key, List<String> ia, List<String>? authorKey, bool? publicScanB
});




}
/// @nodoc
class __$BookPreviewCopyWithImpl<$Res>
    implements _$BookPreviewCopyWith<$Res> {
  __$BookPreviewCopyWithImpl(this._self, this._then);

  final _BookPreview _self;
  final $Res Function(_BookPreview) _then;

/// Create a copy of BookPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coverI = freezed,Object? hasFulltext = freezed,Object? editionCount = freezed,Object? title = null,Object? authorName = null,Object? firstPublishYear = freezed,Object? key = null,Object? ia = null,Object? authorKey = freezed,Object? publicScanB = freezed,}) {
  return _then(_BookPreview(
coverI: freezed == coverI ? _self.coverI : coverI // ignore: cast_nullable_to_non_nullable
as int?,hasFulltext: freezed == hasFulltext ? _self.hasFulltext : hasFulltext // ignore: cast_nullable_to_non_nullable
as bool?,editionCount: freezed == editionCount ? _self.editionCount : editionCount // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self._authorName : authorName // ignore: cast_nullable_to_non_nullable
as List<String>,firstPublishYear: freezed == firstPublishYear ? _self.firstPublishYear : firstPublishYear // ignore: cast_nullable_to_non_nullable
as int?,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,ia: null == ia ? _self._ia : ia // ignore: cast_nullable_to_non_nullable
as List<String>,authorKey: freezed == authorKey ? _self._authorKey : authorKey // ignore: cast_nullable_to_non_nullable
as List<String>?,publicScanB: freezed == publicScanB ? _self.publicScanB : publicScanB // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
