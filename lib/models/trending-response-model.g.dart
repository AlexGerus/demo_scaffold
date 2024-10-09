// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending-response-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponseModel _$TrendingResponseModelFromJson(
        Map<String, dynamic> json) =>
    TrendingResponseModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$TrendingResponseModelToJson(
        TrendingResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
