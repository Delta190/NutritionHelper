import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:nutritionhelperuimodule/hivetables/brandtable.dart';
import 'package:nutritionhelperuimodule/hivetables/userdayintaketable.dart';
import 'package:nutritionhelperuimodule/hivetables/userstatstable.dart';
import 'package:nutritionhelperuimodule/hivetables/producttable.dart';

Future<void> loadProducts() async {
  final productBox = await Hive.openBox<Product>('product');

  final file = File('products.csv');

  final contents = await file.readAsString(); // Read the contents

  final lines = contents.split('\n'); // Split

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(','); // Split the line by commas

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

    productBox.add(product);
  }

  await productBox.close();
}

Future<void> loadUserDayIntake() async {
  final userDayIntakeBox = await Hive.openBox<UserDayIntake>('userDayIntake');

  final file = File('userdayintake.csv');

  final contents = await file.readAsString();

  final lines = contents.split('\n');

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(',');

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

    userDayIntakeBox.add(userDayIntake);
  }

  await userDayIntakeBox.close();
}

Future<void> loadUserStats() async {
  final userStatsBox = await Hive.openBox<UserStats>('userstats');

  final file = File('userstats.csv');

  final contents = await file.readAsString();

  final lines = contents.split('\n');

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(',');

    final userStats = UserStats()
      ..age = int.tryParse(fields[0]) ?? 0
      ..gender = fields[1]
      ..height = double.tryParse(fields[2]) ?? 0.0
      ..weight = double.tryParse(fields[3]) ?? 0.0
      ..allergies = fields[4].split('|')
      ..dietaryPreferences = fields[5].split('|')
      ..favourites = fields[6].split('|');

    userStatsBox.add(userStats);
  }

  await userStatsBox.close();
}

Future<void> loadBrands() async {
  final brandBox = await Hive.openBox<Brand>('brand');

  final file = File('brands.csv');

  final contents = await file.readAsString();

  final lines = contents.split('\n');

  for (var i = 1; i < lines.length; i++) {
    final fields = lines[i].split(',');

    final brand = Brand()
      ..name = fields[0]
      ..description = fields[1]
      ..logoLink = fields[2];

    brandBox.add(brand);
  }

  await brandBox.close();
}

//update/addition functionality below:

Future<void> updateGender(int userID, String newGender) async {
  final box = await Hive.openBox<UserStats>('user_stats');
  final userStats = box.get(userID);
  userStats!.gender = newGender;
  await box.put(userID, userStats);
}

Future<void> updateHeight(int userID, double newHeight) async {
  final box = await Hive.openBox<UserStats>('user_stats');
  final userStats = box.get(userID);
  userStats!.height = newHeight;
  await box.put(userID, userStats);
}

Future<void> updateWeight(int userID, double newWeight) async {
  final box = await Hive.openBox<UserStats>('user_stats');
  final userStats = box.get(userID);
  userStats!.weight = newWeight;
  await box.put(userID, userStats);
}

void addProductNutrition(String userID, String productName) {
  final today = DateTime.now();

  // Search
  final productBox = Hive.box<Product>('products');
  final product = productBox.values.firstWhere((p) => p.name == productName);
  final userDayIntakeBox = Hive.box<UserDayIntake>('userdayintake');
  final userDayIntakeList = userDayIntakeBox.values
      .where((udi) => udi.userID == userID && udi.date == today);

  if (userDayIntakeList.isNotEmpty) {
    // Calculate by addition
    final userDayIntake = userDayIntakeList.first;
    userDayIntake.calories += product.energyKcal;
    userDayIntake.fat += product.fat;
    userDayIntake.saturates += product.saturates;
    userDayIntake.carbohydrates += product.carbohydrate;
    userDayIntake.fibre += product.fibre;
    userDayIntake.protein += product.protein;
    userDayIntake.salt += product.salt;

    // Add the updated record
    userDayIntakeBox.put(userDayIntakeBox.keyAt(0), userDayIntake);
  } else {
    // Create new record
    final newUserDayIntake = UserDayIntake()
      ..userID = userID
      ..date = today
      ..calories = product.energyKcal
      ..fat = product.fat
      ..saturates = product.saturates
      ..carbohydrates = product.carbohydrate
      ..fibre = product.fibre
      ..protein = product.protein
      ..salt = product.salt;

    // Add the record
    userDayIntakeBox.add(newUserDayIntake);
    userDayIntakeBox.close();
  }
}

void addFavourite(String userID, String productName) {
  final userStatsBox = Hive.box<UserStats>('userstats');
  final userStats = userStatsBox.get(userID);

  if (userStats != null) {
    final favourites = List<String>.from(userStats.favourites);
    favourites.add(productName);
    userStats.favourites = favourites;

    userStatsBox.put(userID, userStats);
    userStatsBox.close();
  } else {
    print('addFavourite error, user not found');
  }
}

void delFavourite(String userID, String productName) {
  final userStatsBox = Hive.box<UserStats>('userstats');
  final userStats = userStatsBox.get(userID);

  if (userStats != null && userStats.favourites.contains(productName)) {
    final favourites = List<String>.from(userStats.favourites);
    favourites.remove(productName);
    userStats.favourites = favourites;

    userStatsBox.put(userID, userStats);
    userStatsBox.close();
  } else {
    print('delFavourite error, user/item not found');
  }
}

void addAllergy(String userID, String allergy) {
  final userStatsBox = Hive.box<UserStats>('userstats');
  final userStats = userStatsBox.get(userID);

  if (userStats != null) {
    final allergies = List<String>.from(userStats.allergies);
    allergies.add(allergy);
    userStats.allergies = allergies;

    userStatsBox.put(userID, userStats);
    userStatsBox.close();
  } else {
    print('addAllergy error, user not found');
  }
}

void delAllergy(String userID, String allergy) {
  final userStatsBox = Hive.box<UserStats>('userstats');
  final userStats = userStatsBox.get(userID);

  if (userStats != null && userStats.allergies.contains(allergy)) {
    final allergies = List<String>.from(userStats.allergies);
    allergies.remove(allergy);
    userStats.allergies = allergies;

    userStatsBox.put(userID, userStats);
    userStatsBox.close();
  } else {
    print('delAllergy error, user/allergy not found');
  }
}

void addDietaryPreference(String userID, String preference) {
  final userStatsBox = Hive.box<UserStats>('userstats');
  final userStats = userStatsBox.get(userID);

  if (userStats != null) {
    final preferences = List<String>.from(userStats.dietaryPreferences);
    preferences.add(preference);
    userStats.dietaryPreferences = preferences;

    userStatsBox.put(userID, userStats);
    userStatsBox.close();
  } else {
    print('addDietaryPreference error, user not found');
  }
}

void delDietaryPreference(String userID, String preference) {
  final userStatsBox = Hive.box<UserStats>('userstats');
  final userStats = userStatsBox.get(userID);

  if (userStats != null && userStats.dietaryPreferences.contains(preference)) {
    final preferences = List<String>.from(userStats.dietaryPreferences);
    preferences.remove(preference);
    userStats.dietaryPreferences = preferences;

    userStatsBox.put(userID, userStats);
    userStatsBox.close();
  } else {
    print('delDietaryPreference error, user/preference not found');
  }
}
