// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'player.g.dart';

class Player = _PlayerBase with _$Player;

abstract class _PlayerBase with Store {
  @observable
  String name;

  @observable
  int score;

  @observable
  int wins;

  @observable
  bool? npc;

  @observable
  ObservableList<String>? cards = ObservableList.of([]);

  _PlayerBase({
    this.name = "",
    this.score = 0,
    this.wins = 0,
    this.npc = false,
    this.cards,
  });

  @action
  void setName(String name) {
    this.name = name;
  }

  Player copyWith({
    String? name,
    int? score,
    int? wins,
    bool? npc,
    ObservableList<String>? cards,
  }) {
    return Player(
      name: name ?? this.name,
      score: score ?? this.score,
      wins: wins ?? this.wins,
      npc: npc ?? this.npc,
      cards: cards ?? this.cards,
    );
  }
}
