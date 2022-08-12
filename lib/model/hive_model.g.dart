// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteNewsAdapter extends TypeAdapter<FavoriteNews> {
  @override
  final int typeId = 0;

  @override
  FavoriteNews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteNews()
      ..title = fields[0] as String
      ..author = fields[1] as String
      ..publishedAt = fields[2] as String
      ..description = fields[3] as String
      ..url = fields[4] as String
      ..urlToImage = fields[5] as String
      ..content = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, FavoriteNews obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.publishedAt)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteNewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
