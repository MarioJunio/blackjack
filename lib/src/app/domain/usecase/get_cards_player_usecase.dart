import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

import '../model/deck_card.dart';

abstract class GetCardsPlayerUsecase {
  Future<Either<Failure, List<DeckCard>>> call({
    required String deckId,
    required String playerName,
  });
}
