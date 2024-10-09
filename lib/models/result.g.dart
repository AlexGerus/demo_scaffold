// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      overview: json['overview'] as String?,
      poster_path: json['poster_path'] as String?,
      media_type: json['media_type'] as String?,
      genre_ids:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      release_date: json['release_date'] as String?,
      video: json['video'] as bool?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      vote_count: json['vote_count'] as int?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'adult': instance.adult,
      'video': instance.video,
      'backdrop_path': instance.backdrop_path,
      'title': instance.title,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'media_type': instance.media_type,
      'release_date': instance.release_date,
      'id': instance.id,
      'vote_count': instance.vote_count,
      'popularity': instance.popularity,
      'vote_average': instance.vote_average,
      'genre_ids': instance.genre_ids,
    };
