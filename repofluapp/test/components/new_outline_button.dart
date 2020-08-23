import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repofluapp/components/new_outline_button.dart';

void flutterWidgetNewOutlineButtonTest() {
  group('New Outline Button', () {
    testWidgets('button disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NewOutlineButton(
              text: 'Save repo',
            ),
          ),
        ),
      );
      final name = find.text('Save repo');
      final button = find.byType(OutlineButton);
      
      expect(name, findsOneWidget);
      expect(button, findsOneWidget);
    });
  });
}
