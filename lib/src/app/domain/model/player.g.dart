// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Player on _PlayerBase, Store {
  late final _$nameAtom = Atom(name: '_PlayerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$scoreAtom = Atom(name: '_PlayerBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$winsAtom = Atom(name: '_PlayerBase.wins', context: context);

  @override
  int get wins {
    _$winsAtom.reportRead();
    return super.wins;
  }

  @override
  set wins(int value) {
    _$winsAtom.reportWrite(value, super.wins, () {
      super.wins = value;
    });
  }

  late final _$npcAtom = Atom(name: '_PlayerBase.npc', context: context);

  @override
  bool? get npc {
    _$npcAtom.reportRead();
    return super.npc;
  }

  @override
  set npc(bool? value) {
    _$npcAtom.reportWrite(value, super.npc, () {
      super.npc = value;
    });
  }

  late final _$cardsAtom = Atom(name: '_PlayerBase.cards', context: context);

  @override
  ObservableList<String>? get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<String>? value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$_PlayerBaseActionController =
      ActionController(name: '_PlayerBase', context: context);

  @override
  void setName(String name) {
    final _$actionInfo =
        _$_PlayerBaseActionController.startAction(name: '_PlayerBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
score: ${score},
wins: ${wins},
npc: ${npc},
cards: ${cards}
    ''';
  }
}
