import 'package:blackjack/src/app/domain/model/deck_card.dart';

abstract class PlayerDatasource {
  Future<void> addCardToPlayer(
      String deckId, String cardCode, String playerName);

  Future<List<DeckCard>> getPlayerCards(String deckId, String playerName);

  Future<void> returnCards(String deckId, String playerName);
}
