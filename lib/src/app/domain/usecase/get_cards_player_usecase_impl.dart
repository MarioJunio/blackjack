import 'package:blackjack/src/app/data/datasource/player_datasource.dart';
import 'package:blackjack/src/app/domain/model/deck_card.dart';
import 'package:blackjack/src/app/domain/usecase/get_cards_player_usecase.dart';

class GetCardsPlayerUsecaseImpl implements GetCardsPlayerUsecase {
  final PlayerDatasource _playerDatasource;

  GetCardsPlayerUsecaseImpl(this._playerDatasource);

  @override
  Future<List<DeckCard>> call({
    required String deckId,
    required String playerName,
  }) async {
    return await _playerDatasource.getPlayerCards(deckId, playerName);
  }
}
