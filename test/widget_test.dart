// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nutritionhelperuimodule/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });


  testWidgets('Log ingredients test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the ingredients section is initially empty.
    expect(find.text('Ingredients:'), findsOneWidget);
    expect(find.text('No ingredients logged.'), findsOneWidget);

    // Enter text in the ingredients section and log it to the database.
    await tester.enterText(find.byType(TextField), 'Flour');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the ingredient has been logged to the database.
    expect(find.text('Ingredients:'), findsOneWidget);
    expect(find.text('Flour'), findsOneWidget);

    // Switch to another user's view of the ingredients section.
    // This assumes that there are other users with uploaded ingredients.
    await tester.tap(find.byIcon(Icons.switch_account));
    await tester.pump();

    // Verify that the logged ingredient is visible to other app users.
    expect(find.text('Ingredients:'), findsOneWidget);
    expect(find.text('Flour'), findsOneWidget);
  });


    testWidgets('Log measurements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the measurements section is initially empty.
    expect(find.text('Measurements:'), findsOneWidget);
    expect(find.text('No measurements logged.'), findsOneWidget);

    // Enter values in the measurements section and update the user's measurements.
    await tester.enterText(find.byType(TextField).first, '170');
    await tester.enterText(find.byType(TextField).last, '75');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the measurements have been updated and calculated.
    expect(find.text('Measurements:'), findsOneWidget);
    expect(find.text('Height: 170 cm'), findsOneWidget);
    expect(find.text('Weight: 75 kg'), findsOneWidget);
    expect(find.text('BMI: 25.95'), findsOneWidget);
  });


      testWidgets('Filter test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that all items are initially displayed.
    expect(find.text('Filtered Items'), findsNothing);
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Bananas'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);

    // Activate the filter for apples and trigger a frame.
    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CheckboxListTile).first);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verify that only the filtered items are displayed.
    expect(find.text('Filtered Items'), findsOneWidget);
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Bananas'), findsNothing);
    expect(find.text('Oranges'), findsNothing);
  });

     testWidgets('Keyword Search test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that all items are initially displayed.
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Bananas'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);

    // Enter a search phrase and trigger a frame.
    await tester.enterText(find.byType(TextField), 'app');
    await tester.pumpAndSettle();

    // Verify that only the matching items are displayed.
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Bananas'), findsNothing);
    expect(find.text('Oranges'), findsNothing);

    // Clear the search field and trigger a frame.
    await tester.tap(find.byIcon(Icons.clear));
    await tester.pumpAndSettle();

    // Verify that all items are displayed again.
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Bananas'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);
  });

}
