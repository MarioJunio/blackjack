import 'package:blackjack/src/app/data/datasource/player_datasource.dart';
import 'package:blackjack/src/app/domain/usecase/add_card_to_player_usecase.dart';

class AddCardToPlayerUsecaseImpl implements AddCardToPlayerUsecase {
  final PlayerDatasource _playerDatasource;

  AddCardToPlayerUsecaseImpl(this._playerDatasource);

  @override
  Future<void> call({
    required String deckId,
    required String cardCode,
    required String playerName,
  }) async {
    await _playerDatasource.addCardToPlayer(deckId, cardCode, playerName);
  }
}
