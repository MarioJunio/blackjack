import 'package:blackjack/src/app/data/datasource/deck_datasource.dart';
import 'package:blackjack/src/app/domain/model/deck.dart';
import 'package:blackjack/src/app/shared/exceptions/failure.dart';
import 'package:blackjack/src/app/shared/http/http_client.dart';
import 'package:either_dart/either.dart';

class DeckDatasourceImpl implements DeckDatasource {
  final HttpClient _httpClient;

  DeckDatasourceImpl(this._httpClient);

  @override
  Future<Either<Failure, Deck>> createAndDrawCards(int numOfCards) async {
    final response = await _httpClient.get("/deck/new/draw/?count=$numOfCards");

    if (response.statusCode != 200) {
      return Left(Failure(message: "Não foi possível criar o baralho"));
    }

    return Right(Deck.fromMap(response.data));
  }

  @override
  Future<void> returnCards(String deckId, String playerName) async {
    await _httpClient.get("/deck/$deckId/return/");
  }

  @override
  Future<void> shuffle(String deckId) async {
    await _httpClient.get("/deck/$deckId/shuffle/");
  }
}
