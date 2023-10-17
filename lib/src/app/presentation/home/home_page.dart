import 'package:blackjack/src/app/presentation/home/home_controller.dart';
import 'package:blackjack/src/app/presentation/widgets/button_draw_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _usernameController = TextEditingController();

  final HomeController _homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff378B29),
              Color(0xff378B29),
              Color(0xff74d952),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return TextField(
                    controller: _usernameController,
                    maxLength: 8,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      counterStyle:
                          Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Colors.white54,
                              ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      errorText: _homeController.errorMessage,
                      errorStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.white54,
                              ),
                      hintText: "Qual seu nome?",
                    ),
                  );
                }),
                const SizedBox(height: 32),
                ButtonDrawWidget(
                  text: "Começar",
                  size: const Size(85, 85),
                  enabled: true,
                  onPress: () async {
                    if (await _homeController
                        .saveUsername(_usernameController.text)) {
                      Navigator.pushNamed(context, "/stage");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
