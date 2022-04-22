// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesModelAdapter extends TypeAdapter<TvSeriesModel> {
  @override
  final int typeId = 0;

  @override
  TvSeriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeriesModel(
      imageUrl: fields[0] as String?,
      rating: fields[1] as double?,
      id: fields[2] as int,
      url: fields[3] as String,
      name: fields[4] as String,
      type: fields[5] as String,
      language: fields[6] as String,
      genres: (fields[7] as List).cast<String>(),
      status: fields[8] as String,
      runTime: fields[9] as int,
      averageRuntime: fields[10] as int,
      premiered: fields[11] as String,
      ended: fields[12] as String,
      officialSite: fields[13] as String,
      timeItAirs: fields[14] as String?,
      daysItAirs: (fields[15] as List?)?.cast<String?>(),
      summary: fields[16] as String?,
    )..isFavorite = fields[17] as bool;
  }

  @override
  void write(BinaryWriter writer, TvSeriesModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.rating)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.language)
      ..writeByte(7)
      ..write(obj.genres)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.runTime)
      ..writeByte(10)
      ..write(obj.averageRuntime)
      ..writeByte(11)
      ..write(obj.premiered)
      ..writeByte(12)
      ..write(obj.ended)
      ..writeByte(13)
      ..write(obj.officialSite)
      ..writeByte(14)
      ..write(obj.timeItAirs)
      ..writeByte(15)
      ..write(obj.daysItAirs)
      ..writeByte(16)
      ..write(obj.summary)
      ..writeByte(17)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSeriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
