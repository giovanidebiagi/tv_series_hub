import 'dart:convert';

import 'package:flutter/foundation.dart';

class TvSeriesModel {
  String? imageUrl;
  double? rating;
  int id;
  String url;
  String name;
  String type;
  String language;
  List<String> genres;
  String status;
  int runTime;
  int averageRuntime;
  String premiered;
  String ended;
  String officialSite;
  String? timeItAirs;
  List<String?>? daysItAirs;
  String? summary;

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

  TvSeriesModel copyWith({
    String? imageUrl,
    double? rating,
    int? id,
    String? url,
    String? name,
    String? type,
    String? language,
    List<String>? genres,
    String? status,
    int? runTime,
    int? averageRuntime,
    String? premiered,
    String? ended,
    String? officialSite,
    String? timeItAirs,
    List<String?>? daysItAirs,
    String? summary,
  }) {
    return TvSeriesModel(
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      type: type ?? this.type,
      language: language ?? this.language,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      runTime: runTime ?? this.runTime,
      averageRuntime: averageRuntime ?? this.averageRuntime,
      premiered: premiered ?? this.premiered,
      ended: ended ?? this.ended,
      officialSite: officialSite ?? this.officialSite,
      timeItAirs: timeItAirs ?? this.timeItAirs,
      daysItAirs: daysItAirs ?? this.daysItAirs,
      summary: summary ?? this.summary,
    );
  }

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
