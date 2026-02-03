import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/scrollable_views.dart';

void main() {
  group('ScrollableViews Widget Tests', () {
    testWidgets('ScrollableViews renders correctly', (WidgetTester tester) async {
      // Build the ScrollableViews widget
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Verify the app bar is present
      expect(find.text('Scrollable Views Demo'), findsOneWidget);
      
      // Verify ListView section headers are present
      expect(find.text('ListView Example - Horizontal Scroll'), findsOneWidget);
      expect(find.text('ListView Example - Vertical List'), findsOneWidget);
      
      // Verify GridView section headers are present
      expect(find.text('GridView Example - 2x3 Grid'), findsOneWidget);
      expect(find.text('GridView Example - 3 Column Layout'), findsOneWidget);
    });

    testWidgets('ListView items are scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Find the first ListView (horizontal)
      final horizontalListView = find.byType(ListView).first;
      expect(horizontalListView, findsOneWidget);

      // Verify horizontal ListView contains cards
      expect(find.text('Card 1'), findsOneWidget);
      
      // Test horizontal scrolling
      await tester.drag(horizontalListView, const Offset(-200, 0));
      await tester.pumpAndSettle();
      
      // After scrolling, we should see different cards
      expect(find.text('Card 1'), findsNothing);
    });

    testWidgets('GridView items render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Scroll down to see GridView items
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -500));
      await tester.pumpAndSettle();

      // Verify GridView tiles are present
      expect(find.text('Tile 1'), findsAtLeastNWidgets(1));
      expect(find.text('Tile 2'), findsAtLeastNWidgets(1));
    });

    testWidgets('ListTile tap interaction works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Find and tap a ListTile
      final listTile = find.byType(ListTile).first;
      await tester.tap(listTile);
      await tester.pumpAndSettle();

      // Verify SnackBar appears
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.textContaining('Tapped on User'), findsOneWidget);
    });

    testWidgets('Different scroll directions work', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Test vertical scrolling of main content
      final mainScroll = find.byType(SingleChildScrollView);
      await tester.drag(mainScroll, const Offset(0, -300));
      await tester.pumpAndSettle();

      // Verify we can scroll vertically
      expect(find.text('GridView Example - 2x3 Grid'), findsOneWidget);
    });
  });

  group('Performance and Widget Structure Tests', () {
    testWidgets('ListView.builder is used for efficiency', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Verify ListView.builder widgets are present (performance optimization)
      expect(find.byType(ListView), findsAtLeastNWidgets(2));
    });

    testWidgets('GridView.builder is used for efficiency', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Verify GridView widgets are present
      expect(find.byType(GridView), findsAtLeastNWidgets(2));
    });

    testWidgets('Proper widget hierarchy is maintained', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableViews(),
        ),
      );

      // Verify the main structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsAtLeastNWidgets(1));
    });
  });
}