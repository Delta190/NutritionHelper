// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userstatstable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStatsAdapter extends TypeAdapter<UserStats> {
  @override
  final int typeId = 0;

  @override
  UserStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStats()
      ..age = fields[0] as int
      ..gender = fields[1] as String
      ..height = fields[2] as double
      ..weight = fields[3] as double
      ..allergies = (fields[4] as List).cast<String>()
      ..dietaryPreferences = (fields[5] as List).cast<String>()
      ..favourites = (fields[6] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, UserStats obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.allergies)
      ..writeByte(5)
      ..write(obj.dietaryPreferences)
      ..writeByte(6)
      ..write(obj.favourites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
