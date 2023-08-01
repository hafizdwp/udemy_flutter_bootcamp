import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_flutter_bootcamp/challenge_10_crypto_tracker/util/const.dart';

// const baseUrl = "https://rest.coinapi.io/v1/exchangerate/BTC/USD";
const baseUrl = "https://rest.coinapi.io/v1/exchangerate/";
const apiKey = "40D985DB-0FB8-44AE-93E0-359963B90B46";

class CoynViewModel {
  String _currency = kListCurrencies.first;

  void setCurrency(String currency) {
    _currency = currency;
  }

  String getCurrency() => _currency;
  HashMap<String, dynamic> map = HashMap();

  Future<HashMap<String, dynamic>> getExchangeRates() async {
    await Future.forEach<String>(kListCrypto, (symbol) async {
      Uri url = Uri.parse("$baseUrl$symbol/$_currency");
      http.Response response =
          await http.get(url, headers: {"X-CoinAPI-Key": apiKey});

      map[symbol] = jsonDecode(response.body);
    });

    return map;
  }
}
