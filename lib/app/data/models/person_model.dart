import 'dart:convert';

import 'package:tv_series_hub/app/data/models/tv_series_model.dart';

class PersonModel {
  int id;
  String? url;
  String name;
  String? imageUrl;
  String? country;
  List<TvSeriesModel>? tvSeriesCastingIn;
  PersonModel({
    required this.id,
    this.url,
    required this.name,
    this.imageUrl,
    this.country,
    this.tvSeriesCastingIn,
  });

  PersonModel copyWith({
    int? id,
    String? url,
    String? name,
    String? imageUrl,
    String? country,
    List<TvSeriesModel>? tvSeriesCastingIn,
  }) {
    return PersonModel(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      country: country ?? this.country,
      tvSeriesCastingIn: tvSeriesCastingIn ?? this.tvSeriesCastingIn,
    );
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id']?.toInt() ?? 0,
      url: map['url'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['image'] != null ? map['image']['medium'] : null,
      country: map['country'] != null ? map['country']['name'] : null,
    );
  }

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source));
}
