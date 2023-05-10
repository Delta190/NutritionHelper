import 'package:hive/hive.dart';

part 'userstatstable.g.dart';

@HiveType(typeId: 3)
class UserStats {
  @HiveField(0)
  late int userID;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late String gender;

  @HiveField(3)
  late double height;

  @HiveField(4)
  late double weight;

  @HiveField(5)
  late List<String> allergies;

  @HiveField(6)
  late List<String> dietaryPreferences;

  @HiveField(7)
  late List<String> favourites;
}
