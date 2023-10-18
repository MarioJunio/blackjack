import 'package:blackjack/src/app/data/datasource/player_datasource.dart';
import 'package:blackjack/src/app/domain/usecase/add_card_to_player_usecase.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

class AddCardToPlayerUsecaseImpl implements AddCardToPlayerUsecase {
  final PlayerDatasource _playerDatasource;

  AddCardToPlayerUsecaseImpl(this._playerDatasource);

  @override
  Future<Either<Failure, void>> call({
    required String deckId,
    required String cardCode,
    required String playerName,
  }) async {
    try {
      await _playerDatasource.addCardToPlayer(deckId, cardCode, playerName);
      return const Right(null);
    } catch (exception) {
      return Left(Failure(message: "Não foi possível sacar as cartas"));
    }
  }
}
