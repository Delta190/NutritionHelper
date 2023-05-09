// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdayintaketable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDayIntakeAdapter extends TypeAdapter<UserDayIntake> {
  @override
  final int typeId = 2;

  @override
  UserDayIntake read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDayIntake()
      ..userID = fields[0] as String
      ..date = fields[1] as DateTime
      ..calories = fields[2] as double
      ..fat = fields[3] as double
      ..saturates = fields[4] as double
      ..carbohydrates = fields[5] as double
      ..fibre = fields[6] as double
      ..protein = fields[7] as double
      ..salt = fields[8] as double;
  }

  @override
  void write(BinaryWriter writer, UserDayIntake obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.calories)
      ..writeByte(3)
      ..write(obj.fat)
      ..writeByte(4)
      ..write(obj.saturates)
      ..writeByte(5)
      ..write(obj.carbohydrates)
      ..writeByte(6)
      ..write(obj.fibre)
      ..writeByte(7)
      ..write(obj.protein)
      ..writeByte(8)
      ..write(obj.salt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDayIntakeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
