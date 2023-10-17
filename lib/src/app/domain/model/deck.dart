// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:blackjack/src/app/domain/model/deck_card.dart';
import 'package:stack/stack.dart';

class Deck {
  final bool success;
  final String deckId;
  final Stack<DeckCard> cards;
  final int remaining;

  Deck({
    required this.success,
    required this.deckId,
    required this.cards,
    required this.remaining,
  });

  Deck copyWith({
    bool? success,
    String? deckId,
    Stack<DeckCard>? cards,
    int? remaining,
  }) {
    return Deck(
      success: success ?? this.success,
      deckId: deckId ?? this.deckId,
      cards: cards ?? this.cards,
      remaining: remaining ?? this.remaining,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'deck_id': deckId,
      'remaining': remaining,
    };
  }

  factory Deck.fromMap(Map map) {
    final Stack<DeckCard> cards = Stack();

    (map['cards'] as List).forEach((e) {
      cards.push(DeckCard.fromMap(e));
    });

    return Deck(
      success: map['success'] as bool,
      deckId: map['deck_id'] as String,
      cards: cards,
      remaining: map['remaining'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Deck.fromJson(String source) =>
      Deck.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Deck(success: $success, deckId: $deckId, cards: ${cards.length}, remaining: $remaining)';
  }

  @override
  bool operator ==(covariant Deck other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.deckId == deckId &&
        other.remaining == remaining;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        deckId.hashCode ^
        cards.hashCode ^
        remaining.hashCode;
  }
}
