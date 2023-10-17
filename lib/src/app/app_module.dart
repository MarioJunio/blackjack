import 'package:blackjack/src/app/data/datasource/deck_datasource.dart';
import 'package:blackjack/src/app/data/datasource/deck_datasource_impl.dart';
import 'package:blackjack/src/app/data/datasource/player_datasource.dart';
import 'package:blackjack/src/app/data/datasource/player_datasource_impl.dart';
import 'package:blackjack/src/app/domain/usecase/add_card_to_player_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/add_card_to_player_usecase_impl.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/create_deck_usecase_impl.dart';
import 'package:blackjack/src/app/domain/usecase/get_cards_player_usecase.dart';
import 'package:blackjack/src/app/domain/usecase/get_cards_player_usecase_impl.dart';
import 'package:blackjack/src/app/presentation/home/home_controller.dart';
import 'package:blackjack/src/app/presentation/home/home_page.dart';
import 'package:blackjack/src/app/presentation/stage/stage_controller.dart';
import 'package:blackjack/src/app/presentation/stage/stage_page.dart';
import 'package:blackjack/src/app/shared/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.add(StageController.new);
    i.add(HomeController.new);
    i.add(HttpClient.new);
    i.add<DeckDatasource>(DeckDatasourceImpl.new);
    i.add<PlayerDatasource>(PlayerDatasourceImpl.new);
    i.add<CreateDeckUsecase>(CreateDeckUsecaseImpl.new);
    i.add<AddCardToPlayerUsecase>(AddCardToPlayerUsecaseImpl.new);
    i.add<GetCardsPlayerUsecase>(GetCardsPlayerUsecaseImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => HomePage(),
    );
    r.child(
      "/stage",
      child: (_) => const StagePage(),
    );
  }
}
