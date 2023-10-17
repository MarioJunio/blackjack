import 'package:blackjack/src/app/shared/constants/preferences_keys.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String errorMessage = "";

  @action
  Future<bool> saveUsername(String username) async {
    errorMessage = "";

    if (username.isEmpty) {
      errorMessage = "Informe seu nome para continuar";
      return false;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(PreferencesKeys.username, username);
  }
}
