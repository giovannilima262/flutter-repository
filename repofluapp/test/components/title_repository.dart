import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repofluapp/components/title_repository.dart';

void flutterWidgetTitleRepositoryTest() {
  group('Title Repository', () {
    testWidgets('with title ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleRepository(
              title: 'test',
            ),
          ),
        ),
      );
      final tite = find.text('test');
      expect(tite, findsOneWidget);
    });

    testWidgets('without title ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleRepository(),
          ),
        ),
      );
      final tite = find.text('');
      expect(tite, findsOneWidget);
    });
  });
}
