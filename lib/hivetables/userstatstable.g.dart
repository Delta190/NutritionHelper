// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userstatstable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStatsAdapter extends TypeAdapter<UserStats> {
  @override
  final int typeId = 3;

  @override
  UserStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStats()
      ..userID = fields[0] as int
      ..username = fields[1] as int
      ..age = fields[2] as int
      ..gender = fields[3] as String
      ..height = fields[4] as double
      ..weight = fields[5] as double
      ..allergies = (fields[6] as List).cast<String>()
      ..dietaryPreferences = (fields[7] as List).cast<String>()
      ..favourites = (fields[8] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, UserStats obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.allergies)
      ..writeByte(7)
      ..write(obj.dietaryPreferences)
      ..writeByte(8)
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
