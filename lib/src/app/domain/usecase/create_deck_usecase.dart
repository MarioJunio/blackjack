import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

abstract class CreateDeckUsecase {
  Future<Either<Failure, Deck>> call({
    required int numOfCards,
  });
}
