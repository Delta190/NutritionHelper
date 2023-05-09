import 'dart:io';
import 'package:hive/hive.dart';
import 'package:nutritionhelperuimodule/hivetables/brandtable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:nutritionhelperuimodule/hivetables/userdayintaketable.dart';
import 'package:nutritionhelperuimodule/hivetables/userstatstable.dart';
import 'package:nutritionhelperuimodule/hivetables/producttable.dart';

Future<void> loadProducts() async {
  final productBox = await Hive.openBox<Product>('product');

  // Replace 'products.csv' with the name of your CSV file
  final file = File('products.csv');

  final contents = await file.readAsString(); // Read the contents of the file

  final lines = contents.split('\n'); // Split the contents into lines

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(','); // Split the line by commas

    // Create a new Product object and set its fields
    final product = Product()
      ..name = fields[0]
      ..type = fields[1]
      ..description = fields[2]
      ..brand = fields[3]
      ..weight = double.tryParse(fields[4]) ?? 0.0
      ..weightUnit = fields[5]
      ..price = double.tryParse(fields[6]) ?? 0.0
      ..tags = fields[7].split('|')
      ..energyKJ = double.tryParse(fields[8]) ?? 0.0
      ..energyKcal = double.tryParse(fields[9]) ?? 0.0
      ..fat = double.tryParse(fields[10]) ?? 0.0
      ..saturates = double.tryParse(fields[11]) ?? 0.0
      ..carbohydrate = double.tryParse(fields[12]) ?? 0.0
      ..sugars = double.tryParse(fields[13]) ?? 0.0
      ..fibre = double.tryParse(fields[14]) ?? 0.0
      ..protein = double.tryParse(fields[15]) ?? 0.0
      ..salt = double.tryParse(fields[16]) ?? 0.0
      ..ingredients = fields[17].split('|');

    productBox.add(product); // Add the Product to the Hive table
  }

  await productBox.close(); // Close the Hive box
}

Future<void> loadUserDayIntake() async {
  final userDayIntakeBox = await Hive.openBox<UserDayIntake>('userDayIntake');

  // Replace 'user_day_intake.csv' with the name of your CSV file
  final file = File('userdayintake.csv');

  final contents = await file.readAsString(); // Read the contents of the file

  final lines = contents.split('\n'); // Split the contents into lines

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(','); // Split the line by commas

    // Create a new UserDayIntake object and set its fields
    final userDayIntake = UserDayIntake()
      ..userID = fields[0]
      ..date = DateTime.parse(fields[1])
      ..calories = double.tryParse(fields[2]) ?? 0.0
      ..fat = double.tryParse(fields[3]) ?? 0.0
      ..saturates = double.tryParse(fields[4]) ?? 0.0
      ..carbohydrates = double.tryParse(fields[5]) ?? 0.0
      ..fibre = double.tryParse(fields[6]) ?? 0.0
      ..protein = double.tryParse(fields[7]) ?? 0.0
      ..salt = double.tryParse(fields[8]) ?? 0.0;

    userDayIntakeBox
        .add(userDayIntake); // Add the UserDayIntake to the Hive table
  }

  await userDayIntakeBox.close(); // Close the Hive boxd
}

Future<void> loadUserStats() async {
  final userStatsBox = await Hive.openBox<UserStats>('userstats');

  // Replace 'user_stats.csv' with the name of your CSV file
  final file = File('userstats.csv');

  final contents = await file.readAsString(); // Read the contents of the file

  final lines = contents.split('\n'); // Split the contents into lines

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(','); // Split the line by commas

    // Create a new UserStats object and set its fields
    final userStats = UserStats()
      ..age = int.tryParse(fields[0]) ?? 0
      ..gender = fields[1]
      ..height = double.tryParse(fields[2]) ?? 0.0
      ..weight = double.tryParse(fields[3]) ?? 0.0
      ..allergies = fields[4].split('|')
      ..dietaryPreferences = fields[5].split('|')
      ..favourites = fields[6].split('|');

    userStatsBox.add(userStats); // Add the UserStats to the Hive table
  }

  await userStatsBox.close(); // Close the Hive box
}

Future<void> loadBrands() async {
  final brandBox = await Hive.openBox<Brand>('brand');

  // Replace 'brands.csv' with the name of your CSV file
  final file = File('brands.csv');

  final contents = await file.readAsString(); // Read the contents of the file

  final lines = contents.split('\n'); // Split the contents into lines

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(','); // Split the line by commas

    // Create a new Brand object and set its fields
    final brand = Brand()
      ..name = fields[0]
      ..description = fields[1]
      ..logoLink = fields[2];

    brandBox.add(brand); // Add the Brand to the Hive table
  }

  await brandBox.close(); // Close the Hive box
}
