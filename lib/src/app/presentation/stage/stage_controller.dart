import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/domain/model/player.dart';
import 'package:blackjack/src/app/domain/usecase/add_card_to_player_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/get_cards_player_usecase.dart';
import 'package:blackjack/src/app/shared/constants/preferences_keys.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/deck_card.dart';

part 'stage_controller.g.dart';

class StageController = _StageControllerBase with _$StageController;

abstract class _StageControllerBase with Store {
  final CreateDeckUsecase _createDeckUsecase;
  final AddCardToPlayerUsecase _addCardToPlayerUsecase;
  final GetCardsPlayerUsecase _getCardsPlayerUsecase;

  @observable
  Player user = Player();

  @observable
  Player dealer = Player(name: "Dealer");

  @observable
  bool gameInProgress = false;

  @observable
  bool loading = false;

  @observable
  Deck? deck;

  @observable
  String? lastWinner;

  @observable
  String? error;

  _StageControllerBase(
    this._createDeckUsecase,
    this._addCardToPlayerUsecase,
    this._getCardsPlayerUsecase,
  ) {
    SharedPreferences.getInstance().then((value) {
      user.setName(value.getString(PreferencesKeys.username) ?? "");
    });
  }

  @action
  startGame() async {
    lastWinner = null;
    gameInProgress = true;

    user.score = 0;
    dealer.score = 0;

    user.cards = ObservableList.of([]);
    dealer.cards = ObservableList.of([]);

    await createDeck();
  }

  @action
  reset() async {
    await startGame();

    user.wins = 0;
    dealer.wins = 0;
  }

  @action
  Future<void> createDeck() async {
    try {
      loading = true;
      // deck = await _createDeckUsecase(numOfCards: 52);

      (await _createDeckUsecase(numOfCards: 52))
          .map((deck) => this.deck = deck)
          .mapLeft((errorMessage) => error = errorMessage.message);

      gameInProgress = deck?.success ?? false;
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> drawCardsFromDeck() async {
    // draw top cards of deck
    final DeckCard dealerCard = deck!.cards.pop();
    final DeckCard userCard = deck!.cards.pop();

    try {
      loading = true;

      // attach cards to players
      await _addCardToPlayerUsecase(
        deckId: deck!.deckId,
        cardCode: dealerCard.code,
        playerName: dealer.name,
      );

      await _addCardToPlayerUsecase(
        deckId: deck!.deckId,
        cardCode: userCard.code,
        playerName: user.name,
      );

      dealer.cards ??= ObservableList.of([]);
      user.cards ??= ObservableList.of([]);

      dealer.cards?.add(dealerCard.image);
      user.cards?.add(userCard.image);
    } catch (exception) {
      print("Error on attach cards to players");
      error = "Não foi possível sacar as cartas";
    } finally {
      loading = false;
    }

    // update player scores
    await _updateScores();

    // check winner or loser
    _checkWinnerOrLoser();
  }

  _updateScores() async {
    try {
      loading = true;
      final List<DeckCard> dealerCards = await _getCardsPlayerUsecase(
        deckId: deck!.deckId,
        playerName: dealer.name,
      );

      final List<DeckCard> userCards = await _getCardsPlayerUsecase(
        deckId: deck!.deckId,
        playerName: user.name,
      );

      dealer.score = _recalculatePlayerScore(dealerCards);
      user.score = _recalculatePlayerScore(userCards);
    } catch (exception) {
      print("Error on get cards for players");
      error = "Não foi possível atualizar os pontos dos jogadores";
    } finally {
      loading = false;
    }
  }

  int _recalculatePlayerScore(List<DeckCard> playerCards) {
    int score = 0;

    playerCards.forEach((card) {
      if (card.isAce) {
        if (score + 1 == PreferencesKeys.maxScore) {
          score += 1;
        } else if (score + 11 == PreferencesKeys.maxScore) {
          score += 11;
        } else {
          score += 1;
        }
      } else {
        score += card.valueNumeric;
      }
    });

    return score;
  }

  _checkWinnerOrLoser() {
    int countWinners = 0;
    Player? winner;

    if (dealer.score == PreferencesKeys.maxScore) {
      winner = dealer;
      countWinners++;
    }

    if (user.score == PreferencesKeys.maxScore) {
      winner = user;
      countWinners++;
    }

    if (winner == null) {
      if (user.score > PreferencesKeys.maxScore) {
        winner = dealer;
        countWinners++;
      }

      if (dealer.score > PreferencesKeys.maxScore) {
        winner = user;
        countWinners++;
      }
    }

    if (countWinners > 1) {
      gameInProgress = false;
    } else if (winner != null) {
      gameInProgress = false;
      lastWinner = winner.name;
      winner.wins++;
    }
  }
}
