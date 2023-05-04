import 'package:hive/hive.dart';

part 'product.g.dart';

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
  late double price;

  @HiveField(6)
  late List<String> tags;

  @HiveField(7)
  late double energyKJ;

  @HiveField(8)
  late double energyKcal;

  @HiveField(9)
  late double fat;

  @HiveField(10)
  late double saturates;

  @HiveField(11)
  late double carbohydrate;

  @HiveField(12)
  late double sugars;

  @HiveField(13)
  late double fibre;

  @HiveField(14)
  late double protein;

  @HiveField(15)
  late double salt;

  @HiveField(16)
  late List<String> ingredients;
}
