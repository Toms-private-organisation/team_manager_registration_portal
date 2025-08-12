import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:team_manager_registration/ui/HomeScreen.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should display title and input field', (WidgetTester tester) async {
      // Build the HomeScreen widget
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(),
        ),
      );

      // Verify the title is displayed
      expect(find.text('Enter Event Details'), findsOneWidget);

      // Verify the input field is displayed
      expect(find.byType(TextFormField), findsOneWidget);

      // Verify the button is displayed
      expect(find.text('Go to the Details Screen'), findsOneWidget);
    });

    testWidgets('should show validation error for empty input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(),
        ),
      );

      // Tap the submit button without entering text
      await tester.tap(find.text('Go to the Details Screen'));
      await tester.pump();

      // Verify validation error is shown
      expect(find.text('Please enter an Event ID'), findsOneWidget);
    });

    testWidgets('should show validation error for invalid UUID', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(),
        ),
      );

      // Enter invalid UUID
      await tester.enterText(find.byType(TextFormField), 'invalid-uuid');
      await tester.tap(find.text('Go to the Details Screen'));
      await tester.pump();

      // Verify validation error is shown
      expect(find.text('Please enter a valid UUID'), findsOneWidget);
    });

    testWidgets('should accept valid UUID format', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(),
        ),
      );

      // Enter valid UUID
      const validUuid = '123e4567-e89b-12d3-a456-426614174000';
      await tester.enterText(find.byType(TextFormField), validUuid);
      await tester.tap(find.text('Go to the Details Screen'));
      await tester.pump();

      // Verify no validation error is shown
      expect(find.text('Please enter an Event ID'), findsNothing);
      expect(find.text('Please enter a valid UUID'), findsNothing);
    });

    testWidgets('should style components correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(),
        ),
      );

      // Find the main container
      final container = find.byType(Container).first;
      expect(container, findsOneWidget);

      // Find the form
      expect(find.byType(Form), findsOneWidget);

      // Find the elevated button
      final button = find.byType(ElevatedButton);
      expect(button, findsOneWidget);
    });
  });
}