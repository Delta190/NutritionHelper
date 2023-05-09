import 'package:hive/hive.dart';

part 'producttable.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String type;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late String brand;

  @HiveField(4)
  late double weight;

  @HiveField(5)
  late String weightUnit;

  @HiveField(6)
  late double price;

  @HiveField(7)
  late List<String> tags;

  @HiveField(8)
  late double energyKJ;

  @HiveField(9)
  late double energyKcal;

  @HiveField(10)
  late double fat;

  @HiveField(11)
  late double saturates;

  @HiveField(12)
  late double carbohydrate;

  @HiveField(13)
  late double sugars;

  @HiveField(14)
  late double fibre;

  @HiveField(15)
  late double protein;

  @HiveField(16)
  late double salt;

  @HiveField(17)
  late List<String> ingredients;
}
