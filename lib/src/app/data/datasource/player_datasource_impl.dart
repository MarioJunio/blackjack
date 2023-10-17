import 'package:blackjack/src/app/data/datasource/player_datasource.dart';
import 'package:blackjack/src/app/domain/model/deck_card.dart';
import 'package:blackjack/src/app/shared/http/http_client.dart';

class PlayerDatasourceImpl implements PlayerDatasource {
  final HttpClient _httpClient;

  PlayerDatasourceImpl(this._httpClient);

  @override
  Future<void> addCardToPlayer(
      String deckId, String cardCode, String playerName) async {
    await _httpClient.get(
      "/deck/$deckId/pile/$playerName/add/",
      queryParameters: {
        "cards": cardCode,
      },
    );
  }

  @override
  Future<List<DeckCard>> getPlayerCards(
      String deckId, String playerName) async {
    final response =
        await _httpClient.get("/deck/$deckId/pile/$playerName/list/");

    return (response.data['piles'][playerName]['cards'] as List)
        .map((card) => DeckCard.fromMap(card))
        .toList();
  }

  @override
  Future<void> returnCards(String deckId, String playerName) async {
    await _httpClient.get("/deck/$deckId/pile/$playerName/return/");
  }
}
