import 'package:hive/hive.dart';

part 'userstatstable.g.dart';

@HiveType(typeId: 3)
class UserStats {
  @HiveField(0)
  late int userID;

  @HiveField(1)
  late int username;

  @HiveField(2)
  late int age;

  @HiveField(3)
  late String gender;

  @HiveField(4)
  late double height;

  @HiveField(5)
  late double weight;

  @HiveField(6)
  late List<String> allergies;

  @HiveField(7)
  late List<String> dietaryPreferences;

  @HiveField(8)
  late List<String> favourites;
}
