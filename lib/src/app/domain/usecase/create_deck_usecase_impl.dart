import 'package:blackjack/src/app/data/datasource/deck_datasource.dart';
import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

class CreateDeckUsecaseImpl implements CreateDeckUsecase {
  final DeckDatasource _deckDatasource;

  CreateDeckUsecaseImpl(this._deckDatasource);

  @override
  Future<Either<Failure, Deck>> call({
    required int numOfCards,
  }) async {
    try {
      return await _deckDatasource.createAndDrawCards(numOfCards);
    } catch (exception) {
      return Left(Failure(message: "Não foi possível criar o baralho"));
    }
  }
}
