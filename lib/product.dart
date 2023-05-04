import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String type;

  @HiveField(2)
  String description;

  @HiveField(3)
  String brand;

  @HiveField(4)
  double weight;

  @HiveField(5)
  double price;

  @HiveField(6)
  List<String> tags;

  @HiveField(7)
  double energyKJ;

  @HiveField(8)
  double energyKcal;

  @HiveField(9)
  double fat;

  @HiveField(10)
  double saturates;

  @HiveField(11)
  double carbohydrate;

  @HiveField(12)
  double sugars;

  @HiveField(13)
  double fibre;

  @HiveField(14)
  double protein;

  @HiveField(15)
  double salt;

  @HiveField(16)
  List<String> ingredients;
}
