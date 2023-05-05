import 'package:hive/hive.dart';

part 'brand.g.dart';

@HiveType(typeId: 1)
class Brand extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late String logoLink;
}
