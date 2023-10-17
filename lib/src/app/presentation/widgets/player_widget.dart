import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:transparent_image/transparent_image.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    super.key,
    required this.name,
    required this.score,
    required this.cards,
    this.player = false,
    this.wins = 0,
  });

  final String name;
  final int score;
  final ObservableList<String> cards;
  final bool? player;
  final int? wins;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: cards.isEmpty ? [_defaultCard] : _cards,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _playerScore(context),
            _wons(context),
          ],
        ),
      ],
    );
  }

  Widget _playerScore(context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white54, width: 1.5),
        ),
        child: SizedBox(
          width: 110,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: player! ? FontWeight.bold : FontWeight.w400,
                    ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "$score pts",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _wons(context) => Visibility(
        visible: wins! > 0,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "assets/images/win.png",
              height: 30,
              color: Colors.white54,
            ),
            Positioned(
              top: 6,
              left: 12,
              child: Text(
                wins.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );

  Widget get _defaultCard => FadeInImage.memoryNetwork(
        image: "https://www.deckofcardsapi.com/static/img/back.png",
        height: 100,
        placeholder: kTransparentImage,
      );

  List<Widget> get _cards {
    final List<int> fixedList = Iterable<int>.generate(cards.length).toList();

    return fixedList.map(
      (index) {
        final String cardImgUrl = cards[index];

        if (index == 0) {
          return Positioned(
            child: FadeInImage.memoryNetwork(
              image: cardImgUrl,
              height: 100,
              placeholder: kTransparentImage,
            ),
          );
        }

        return Positioned(
          left: 11 * index.toDouble(),
          child: Image.network(
            cardImgUrl,
            height: 100,
          ),
        );
      },
    ).toList();
  }
}
