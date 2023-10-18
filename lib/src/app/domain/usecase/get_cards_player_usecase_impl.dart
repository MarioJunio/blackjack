import 'package:blackjack/src/app/data/datasource/player_datasource.dart';
import 'package:blackjack/src/app/domain/model/deck_card.dart';
import 'package:blackjack/src/app/domain/usecase/get_cards_player_usecase.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

class GetCardsPlayerUsecaseImpl implements GetCardsPlayerUsecase {
  final PlayerDatasource _playerDatasource;

  GetCardsPlayerUsecaseImpl(this._playerDatasource);

  @override
  Future<Either<Failure, List<DeckCard>>> call({
    required String deckId,
    required String playerName,
  }) async {
    try {
      return Right(await _playerDatasource.getPlayerCards(deckId, playerName));
    } catch (exception) {
      return Left(
        Failure(message: "Não foi possível atualizar os pontos dos jogadores"),
      );
    }
  }
}
