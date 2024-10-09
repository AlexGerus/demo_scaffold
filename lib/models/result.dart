import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final bool? adult, video;
  final String? backdrop_path,
      title,
      original_language,
      original_title,
      overview,
      poster_path,
      media_type,
      release_date;
  final int? id, vote_count;
  final double? popularity, vote_average;
  final List<int>? genre_ids;

  Result(
      {this.adult,
      this.backdrop_path,
      this.id,
      this.title,
      this.original_language,
      this.original_title,
      this.overview,
      this.poster_path,
      this.media_type,
      this.genre_ids,
      this.popularity,
      this.release_date,
      this.video,
      this.vote_average,
      this.vote_count});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
