import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repofluapp/components/new_outline_button.dart';
import 'package:repofluapp/components/repository_card.dart';
import 'package:repofluapp/components/title_repository.dart';
import 'package:repofluapp/models/repository.dart';
import 'package:repofluapp/utils/format_date.dart';

import '../default_values/repository_list_values_json.dart';

void flutterWidgetRepositoryCardTest() {
  group('Repository Card', () {
    RepositoryModel repositoryModel = RepositoryModel.convertJsonList(
        RepositoryListValuesJson().oneRepository().object)[0];
    testWidgets('values text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RepositoryCard(
              textButton: 'Save repo',
              value: repositoryModel,
            ),
          ),
        ),
      );
      final name = find.byType(TitleRepository);
      final createdAt = find.text(
        FormatDate.jsonToFormatString(repositoryModel.createdAt),
      );
      final description = find.text(repositoryModel.description);
      final language = find.text(repositoryModel.language);
      final stargazersCount = find.text(
        repositoryModel.stargazersCount.toString(),
      );
      final buttonSave = find.byType(NewOutlineButton);

      expect(name, findsOneWidget);
      expect(createdAt, findsOneWidget);
      expect(description, findsOneWidget);
      expect(language, findsWidgets);
      expect(stargazersCount, findsOneWidget);
      expect(buttonSave, findsOneWidget);
    });

    testWidgets('click save', (WidgetTester tester) async {
      bool click = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RepositoryCard(
              textButton: 'Save repo',
              value: repositoryModel,
              onSave: () => click = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(NewOutlineButton));

      expect(click, isTrue);
    });
  });
}
