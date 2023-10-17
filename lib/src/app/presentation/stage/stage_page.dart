import 'package:blackjack/src/app/presentation/stage/stage_controller.dart';
import 'package:blackjack/src/app/presentation/widgets/button_draw_widget.dart';
import 'package:blackjack/src/app/presentation/widgets/player_widget.dart';
import 'package:blackjack/src/app/presentation/widgets/winner_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class StagePage extends StatefulWidget {
  const StagePage({super.key});

  @override
  State<StagePage> createState() => _StagePageState();
}

class _StagePageState extends State<StagePage> {
  final StageController _stageController = Modular.get();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _init();

    _stageController.startGame();
  }

  void _init() {
    reaction((p0) => _stageController.error, (error) {
      if (error != null) {
        _scaffoldKey.currentState?.showBottomSheet(
          (context) => Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ReactionBuilder(
        builder: (context) {
          return reaction(
            (_) => _stageController.gameInProgress,
            (gameInProgress) {
              if (!gameInProgress) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => WinnerDialog(
                    playerWinner: _stageController.lastWinner,
                    newMatch: () async {
                      await _stageController.startGame();
                      Navigator.pop(context);
                    },
                    reset: () async {
                      await _stageController.reset();
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
          );
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff74d952),
                  Color(0xff378B29),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlayerWidget(
                    name: _stageController.dealer.name,
                    score: _stageController.dealer.score,
                    wins: _stageController.dealer.wins,
                    cards:
                        _stageController.dealer.cards ?? ObservableList.of([]),
                  ),
                  ButtonDrawWidget(
                    text: "Sacar",
                    onPress: _stageController.drawCardsFromDeck,
                    enabled: _stageController.gameInProgress &&
                        !_stageController.loading,
                  ),
                  PlayerWidget(
                    name: _stageController.user.name,
                    score: _stageController.user.score,
                    wins: _stageController.user.wins,
                    player: true,
                    cards: _stageController.user.cards ?? ObservableList.of([]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
