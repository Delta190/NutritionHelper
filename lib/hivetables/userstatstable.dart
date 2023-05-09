import 'package:hive/hive.dart';

part 'userstatstable.g.dart';

@HiveType(typeId: 0)
class UserStats {
  @HiveField(0)
  late int age;

  @HiveField(1)
  late String gender;

  @HiveField(2)
  late double height;

  @HiveField(3)
  late double weight;

  @HiveField(4)
  late List<String> allergies;

  @HiveField(5)
  late List<String> dietaryPreferences;
}
