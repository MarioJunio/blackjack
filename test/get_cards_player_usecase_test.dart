import 'package:blackjack/src/app/data/datasource/deck_datasource.dart';
import 'package:blackjack/src/app/data/datasource/deck_datasource_impl.dart';
import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase_impl.dart';
import 'package:blackjack/src/app/shared/http/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'mocks.dart';

void main() {
  final HttpClient httpClient = HttpClient();
  final DioAdapter dioAdapter = DioAdapter(dio: httpClient);

  setUp(() {
    httpClient.httpClientAdapter = dioAdapter;
  });

  group('Deck cases', () {
    test(
      "Create deck",
      () async {
        const int numOfCards = 4;

        dioAdapter.onGet(
          "/deck/new/draw/?count=$numOfCards",
          (server) {
            return server.reply(200, deck4);
          },
        );

        final DeckDatasource deckDatasource = DeckDatasourceImpl(httpClient);

        final CreateDeckUsecase createDeckUsecase =
            CreateDeckUsecaseImpl(deckDatasource);

        final response = await createDeckUsecase(numOfCards: 4);

        expect(response, Deck.fromMap(deck4));
      },
    );
  });
}
