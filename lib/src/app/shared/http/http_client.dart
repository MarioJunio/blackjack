import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

class HttpClient extends DioForBrowser {
  HttpClient()
      : super(
          BaseOptions(
            baseUrl: "https://www.deckofcardsapi.com/api",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );
}
