// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producttable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product()
      ..name = fields[0] as String
      ..type = fields[1] as String
      ..description = fields[2] as String
      ..brand = fields[3] as String
      ..weight = fields[4] as double
      ..price = fields[5] as double
      ..tags = (fields[6] as List).cast<String>()
      ..energyKJ = fields[7] as double
      ..energyKcal = fields[8] as double
      ..fat = fields[9] as double
      ..saturates = fields[10] as double
      ..carbohydrate = fields[11] as double
      ..sugars = fields[12] as double
      ..fibre = fields[13] as double
      ..protein = fields[14] as double
      ..salt = fields[15] as double
      ..ingredients = (fields[16] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.energyKJ)
      ..writeByte(8)
      ..write(obj.energyKcal)
      ..writeByte(9)
      ..write(obj.fat)
      ..writeByte(10)
      ..write(obj.saturates)
      ..writeByte(11)
      ..write(obj.carbohydrate)
      ..writeByte(12)
      ..write(obj.sugars)
      ..writeByte(13)
      ..write(obj.fibre)
      ..writeByte(14)
      ..write(obj.protein)
      ..writeByte(15)
      ..write(obj.salt)
      ..writeByte(16)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
