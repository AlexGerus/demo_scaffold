import 'dart:convert';

import 'package:demo_scaffold/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trending-response-model.g.dart';

TrendingResponseModel trendingResponseModelFromJson(String str) =>
    TrendingResponseModel.fromJson(json.decode(str));

String trendingResponseModelToJson(TrendingResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TrendingResponseModel {
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  TrendingResponseModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory TrendingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingResponseModelToJson(this);
}
