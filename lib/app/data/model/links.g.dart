// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinkurlAdapter extends TypeAdapter<Linkurl> {
  @override
  final int typeId = 4;

  @override
  Linkurl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Linkurl(
      number: fields[0] as int,
      link: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Linkurl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkurlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
