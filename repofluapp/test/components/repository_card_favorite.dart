import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repofluapp/components/repository_card_favorite.dart';
import 'package:repofluapp/components/title_repository.dart';
import 'package:repofluapp/models/repository.dart';

import '../default_values/repository_list_values_json.dart';

void flutterWidgetRepositoryCardFavoriteTest() {
  group('Repository Card Favorite', () {
    RepositoryModel repositoryModel = RepositoryModel.convertJsonList(
        RepositoryListValuesJson().oneRepository().object)[0];
    testWidgets('values text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RepositoryCardFavorite(
              value: repositoryModel,
            ),
          ),
        ),
      );
      final name = find.byType(TitleRepository);

      expect(name, findsOneWidget);
    });

    testWidgets('click remove', (WidgetTester tester) async {
      bool click = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RepositoryCardFavorite(
              value: repositoryModel,
              onRemove: () => click = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(Key('remove')));

      expect(click, isTrue);
    });
  });
}
