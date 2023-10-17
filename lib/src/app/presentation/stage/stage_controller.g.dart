// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StageController on _StageControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_StageControllerBase.user', context: context);

  @override
  Player get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Player value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$dealerAtom =
      Atom(name: '_StageControllerBase.dealer', context: context);

  @override
  Player get dealer {
    _$dealerAtom.reportRead();
    return super.dealer;
  }

  @override
  set dealer(Player value) {
    _$dealerAtom.reportWrite(value, super.dealer, () {
      super.dealer = value;
    });
  }

  late final _$gameInProgressAtom =
      Atom(name: '_StageControllerBase.gameInProgress', context: context);

  @override
  bool get gameInProgress {
    _$gameInProgressAtom.reportRead();
    return super.gameInProgress;
  }

  @override
  set gameInProgress(bool value) {
    _$gameInProgressAtom.reportWrite(value, super.gameInProgress, () {
      super.gameInProgress = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_StageControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$deckAtom =
      Atom(name: '_StageControllerBase.deck', context: context);

  @override
  Deck? get deck {
    _$deckAtom.reportRead();
    return super.deck;
  }

  @override
  set deck(Deck? value) {
    _$deckAtom.reportWrite(value, super.deck, () {
      super.deck = value;
    });
  }

  late final _$lastWinnerAtom =
      Atom(name: '_StageControllerBase.lastWinner', context: context);

  @override
  String? get lastWinner {
    _$lastWinnerAtom.reportRead();
    return super.lastWinner;
  }

  @override
  set lastWinner(String? value) {
    _$lastWinnerAtom.reportWrite(value, super.lastWinner, () {
      super.lastWinner = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_StageControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$startGameAsyncAction =
      AsyncAction('_StageControllerBase.startGame', context: context);

  @override
  Future startGame() {
    return _$startGameAsyncAction.run(() => super.startGame());
  }

  late final _$resetAsyncAction =
      AsyncAction('_StageControllerBase.reset', context: context);

  @override
  Future reset() {
    return _$resetAsyncAction.run(() => super.reset());
  }

  late final _$createDeckAsyncAction =
      AsyncAction('_StageControllerBase.createDeck', context: context);

  @override
  Future<void> createDeck() {
    return _$createDeckAsyncAction.run(() => super.createDeck());
  }

  late final _$drawCardsFromDeckAsyncAction =
      AsyncAction('_StageControllerBase.drawCardsFromDeck', context: context);

  @override
  Future<void> drawCardsFromDeck() {
    return _$drawCardsFromDeckAsyncAction.run(() => super.drawCardsFromDeck());
  }

  @override
  String toString() {
    return '''
user: ${user},
dealer: ${dealer},
gameInProgress: ${gameInProgress},
loading: ${loading},
deck: ${deck},
lastWinner: ${lastWinner},
error: ${error}
    ''';
  }
}
