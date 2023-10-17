// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeckCard {
  final String code;
  final String image;
  final String value;
  final String suit;

  DeckCard({
    required this.code,
    required this.image,
    required this.value,
    required this.suit,
  });

  int get valueNumeric {
    int numericValue = int.tryParse(value) ?? 0;

    if (numericValue == 0) {
      switch (value) {
        case "KING":
        case "JACK":
        case "QUEEN":
          numericValue = 10;
      }
    }

    return numericValue;
  }

  bool get isAce => value == "ACE";

  DeckCard copyWith({
    String? code,
    String? image,
    String? value,
    String? suit,
  }) {
    return DeckCard(
      code: code ?? this.code,
      image: image ?? this.image,
      value: value ?? this.value,
      suit: suit ?? this.suit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'image': image,
      'value': value,
      'suit': suit,
    };
  }

  factory DeckCard.fromMap(Map map) {
    return DeckCard(
      code: map['code'] as String,
      image: map['image'] as String,
      value: map['value'] as String,
      suit: map['suit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeckCard.fromJson(String source) =>
      DeckCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeckCard(code: $code, image: $image, value: $value, suit: $suit)';
  }

  @override
  bool operator ==(covariant DeckCard other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.image == image &&
        other.value == value &&
        other.suit == suit;
  }

  @override
  int get hashCode {
    return code.hashCode ^ image.hashCode ^ value.hashCode ^ suit.hashCode;
  }
}
