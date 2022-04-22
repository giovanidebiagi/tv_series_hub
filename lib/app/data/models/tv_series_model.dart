import 'dart:convert';
import 'package:hive/hive.dart';

part 'tv_series_model.g.dart';

@HiveType(typeId: 0)
class TvSeriesModel extends HiveObject {
  @HiveField(0)
  String? imageUrl;

  @HiveField(1)
  double? rating;

  @HiveField(2)
  int id;

  @HiveField(3)
  String url;

  @HiveField(4)
  String name;

  @HiveField(5)
  String type;

  @HiveField(6)
  String language;

  @HiveField(7)
  List<String> genres;

  @HiveField(8)
  String status;

  @HiveField(9)
  int runTime;

  @HiveField(10)
  int averageRuntime;

  @HiveField(11)
  String premiered;

  @HiveField(12)
  String ended;

  @HiveField(13)
  String officialSite;

  @HiveField(14)
  String? timeItAirs;

  @HiveField(15)
  List<String?>? daysItAirs;

  @HiveField(16)
  String? summary;

  @HiveField(17)
  bool? isFavorite;

  TvSeriesModel({
    this.imageUrl,
    this.rating,
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runTime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.timeItAirs,
    required this.daysItAirs,
    required this.summary,
  });

  factory TvSeriesModel.fromMap(Map<String, dynamic> map) {
    return TvSeriesModel(
      imageUrl: map['image'] != null ? map['image']['medium'] : null,
      rating:
          map['rating'] != null ? map['rating']['average']?.toDouble() : null,
      id: map['id']?.toInt() ?? 0,
      url: map['url'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      language: map['language'] ?? '',
      genres: List<String>.from(map['genres']),
      status: map['status'] ?? '',
      runTime: map['runTime']?.toInt() ?? 0,
      averageRuntime: map['averageRuntime']?.toInt() ?? 0,
      premiered: map['premiered'] ?? '',
      ended: map['ended'] ?? '',
      officialSite: map['officialSite'] ?? '',
      timeItAirs: map['schedule'] != null ? map['schedule']['time'] : null,
      daysItAirs: (map['schedule'] != null && map['schedule']['days'] != null)
          ? List<String>.from(map['schedule']['days'])
          : null,
      summary: map['summary'],
    );
  }

  factory TvSeriesModel.fromJson(String source) =>
      TvSeriesModel.fromMap(json.decode(source));
}
