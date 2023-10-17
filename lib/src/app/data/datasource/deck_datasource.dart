import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

abstract class DeckDatasource {
  Future<Either<Failure, Deck>> createAndDrawCards(int numOfCards);

  Future<void> returnCards(String deckId, String playerName);

  Future<void> shuffle(String deckId);
}
