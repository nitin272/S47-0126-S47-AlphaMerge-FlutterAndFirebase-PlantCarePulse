import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/user_input_form.dart';

void main() {
  group('UserInputForm Widget Tests', () {
    testWidgets('should display all form fields and buttons', (WidgetTester tester) async {
      // Build the UserInputForm widget
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify that all form fields are present
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Phone Number'), findsOneWidget);
      expect(find.text('Message'), findsOneWidget);
      
      // Verify buttons are present
      expect(find.text('Submit Form'), findsOneWidget);
      expect(find.text('Clear Form'), findsOneWidget);
      
      // Verify form structure
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('should have proper form structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify the form has the correct structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      
      // Verify all text fields are present
      final textFields = find.byType(TextFormField);
      expect(textFields, findsNWidgets(4));
      
      // Verify icons are present
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
      expect(find.byIcon(Icons.phone), findsOneWidget);
      expect(find.byIcon(Icons.message), findsOneWidget);
    });

    testWidgets('should have controllers attached to fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      final textFields = find.byType(TextFormField);
      
      // Verify all fields have controllers
      for (int i = 0; i < 4; i++) {
        final field = tester.widget<TextFormField>(textFields.at(i));
        expect(field.controller, isNotNull);
      }
    });

    testWidgets('should accept text input in fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      final textFields = find.byType(TextFormField);

      // Test entering text in each field
      await tester.enterText(textFields.at(0), 'John Doe');
      await tester.enterText(textFields.at(1), 'john@example.com');
      await tester.enterText(textFields.at(2), '+1234567890');
      await tester.enterText(textFields.at(3), 'This is a test message.');

      // Verify text was entered
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
      expect(find.text('+1234567890'), findsOneWidget);
      expect(find.text('This is a test message.'), findsOneWidget);
    });

    testWidgets('should display hint texts', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify hint texts are present
      expect(find.text('Enter your full name'), findsOneWidget);
      expect(find.text('Enter your email address'), findsOneWidget);
      expect(find.text('Enter your phone number'), findsOneWidget);
      expect(find.text('Enter your message (minimum 10 characters)'), findsOneWidget);
    });
  });

  group('UserInputForm UI Tests', () {
    testWidgets('should have proper styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify AppBar is present with title
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.title, isA<Text>());
      
      // Verify form has proper padding
      expect(find.byType(Padding), findsWidgets);
      
      // Verify container with decoration exists
      expect(find.byType(Container), findsWidgets);
      
      // Verify proper spacing
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('should display header section', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify header elements
      expect(find.text('Contact Information'), findsOneWidget);
      expect(find.text('Please fill out all fields below'), findsOneWidget);
      expect(find.byIcon(Icons.contact_mail), findsOneWidget);
    });

    testWidgets('should have proper button styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify buttons exist
      final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final outlinedButton = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
      
      expect(elevatedButton, isNotNull);
      expect(outlinedButton, isNotNull);
      
      // Verify button text
      expect(find.text('Submit Form'), findsOneWidget);
      expect(find.text('Clear Form'), findsOneWidget);
    });

    testWidgets('should have proper app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify app bar title
      expect(find.text('User Input Form'), findsOneWidget);
    });

    testWidgets('should display all required UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInputForm(),
        ),
      );

      // Verify all major UI components are present
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });
}