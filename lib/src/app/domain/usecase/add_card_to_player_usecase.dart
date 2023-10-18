import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

abstract class AddCardToPlayerUsecase {
  Future<Either<Failure, void>> call({
    required String deckId,
    required String cardCode,
    required String playerName,
  });
}
