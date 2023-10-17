abstract class AddCardToPlayerUsecase {
  Future<void> call({
    required String deckId,
    required String cardCode,
    required String playerName,
  });
}
