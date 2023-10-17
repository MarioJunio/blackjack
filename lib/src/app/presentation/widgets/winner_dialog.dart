import 'package:flutter/material.dart';

class WinnerDialog extends StatelessWidget {
  const WinnerDialog({
    super.key,
    required this.playerWinner,
    required this.newMatch,
    required this.reset,
  });

  final String? playerWinner;
  final Function() newMatch;
  final Function() reset;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _body(context),
    );
  }

  Widget _body(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xffC8E4B2),
            borderRadius: BorderRadius.circular(90),
          ),
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Fim de jogo",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: playerWinner == null,
                  child: Text(
                    "Empate!",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Visibility(
                  visible: playerWinner != null,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: playerWinner,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: " venceu a partida!",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _btnOption(
                      context,
                      "Nova partida",
                      newMatch,
                    ),
                    _btnOption(
                      context,
                      "Reiniciar",
                      reset,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnOption(BuildContext context, String text, Function() onPressed) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xffA0C49D),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
        ),
      );
}
