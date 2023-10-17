import '../model/deck_card.dart';

abstract class GetCardsPlayerUsecase {
  Future<List<DeckCard>> call({
    required String deckId,
    required String playerName,
  });
}
