import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/domain/usecase/add_card_to_player_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/get_cards_player_usecase.dart';
import 'package:blackjack/src/app/presentation/stage/stage_controller.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

class CreateDeckUsecaseMock extends Mock implements CreateDeckUsecase {
  @override
  Future<Either<Failure, Deck>> call({
    required int numOfCards,
  }) async {
    return Right(Deck.fromMap(deck4));
  }
}

class AddCardToPlayerUsecaseMock extends Mock
    implements AddCardToPlayerUsecase {}

class GetCardsPlayerUsecaseMock extends Mock implements GetCardsPlayerUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final CreateDeckUsecaseMock createDeckUsecaseMock = CreateDeckUsecaseMock();

  final StageController stageController = StageController(
    createDeckUsecaseMock,
    AddCardToPlayerUsecaseMock(),
    GetCardsPlayerUsecaseMock(),
  );

  group('Stage Controller', () {
    test(
      "Create deck",
      () async {
        await stageController.createDeck();

        expect(stageController.deck, Deck.fromMap(deck4));
      },
    );
  });
}
