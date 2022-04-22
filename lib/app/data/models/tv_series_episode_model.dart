import 'dart:convert';

class TvSeriesEpisodeModel {
  String name;
  int number;
  int season;
  String? summary;
  String? imageUrl;
  TvSeriesEpisodeModel({
    required this.name,
    required this.number,
    required this.season,
    this.summary,
    this.imageUrl,
  });

  TvSeriesEpisodeModel copyWith({
    String? name,
    int? number,
    int? season,
    String? summary,
    String? imageUrl,
  }) {
    return TvSeriesEpisodeModel(
      name: name ?? this.name,
      number: number ?? this.number,
      season: season ?? this.season,
      summary: summary ?? this.summary,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory TvSeriesEpisodeModel.fromMap(Map<String, dynamic> map) {
    return TvSeriesEpisodeModel(
      name: map['name'] ?? '',
      number: map['number']?.toInt() ?? 0,
      season: map['season']?.toInt() ?? 0,
      summary: map['summary'],
      imageUrl: map['image'] != null ? map['image']['medium'] : null,
    );
  }

  factory TvSeriesEpisodeModel.fromJson(String source) =>
      TvSeriesEpisodeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TvSeriesEpisodeModel(name: $name, number: $number, season: $season, summary: $summary, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TvSeriesEpisodeModel &&
        other.name == name &&
        other.number == number &&
        other.season == season &&
        other.summary == summary &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        number.hashCode ^
        season.hashCode ^
        summary.hashCode ^
        imageUrl.hashCode;
  }
}
