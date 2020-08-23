import 'api/flutter_repository_test.dart';
import 'components/new_outline_button.dart';
import 'components/repository_card.dart';
import 'components/repository_card_favorite.dart';
import 'components/title_repository.dart';
import 'model/repository_test.dart';
import 'providers/repository_list_test.dart';

void main() {
  flutterRepositoryTest();
  flutterRepositoryModelTest();
  flutterRepositoryListProviderTest();
  flutterWidgetTitleRepositoryTest();
  flutterWidgetRepositoryCardTest();
  flutterWidgetNewOutlineButtonTest();
  flutterWidgetRepositoryCardFavoriteTest();
}
