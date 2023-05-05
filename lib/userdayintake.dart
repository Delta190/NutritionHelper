import 'package:hive/hive.dart';

part 'userdayintake.g.dart';

@HiveType(typeId: 2)
class UserDayIntake extends HiveObject {
  @HiveField(0)
  late String userID;

  @HiveField(1)
  late DateTime date;

  @HiveField(2)
  late double calories;

  @HiveField(3)
  late double fat;

  @HiveField(4)
  late double saturates;

  @HiveField(5)
  late double carbohydrates;

  @HiveField(6)
  late double fibre;

  @HiveField(7)
  late double protein;

  @HiveField(8)
  late double salt;
}
