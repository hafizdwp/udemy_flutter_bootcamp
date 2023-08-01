import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_10_crypto_tracker/model/coyn_viewmodel.dart';
import 'package:udemy_flutter_bootcamp/challenge_10_crypto_tracker/util/const.dart';

CoynViewModel viewModel = CoynViewModel();

class Coyn extends StatefulWidget {
  const Coyn({Key? key}) : super(key: key);

  @override
  State<Coyn> createState() => _CoynState();
}

class _CoynState extends State<Coyn> {
  String btcRate = "";
  String ethRate = "";
  String ltcRate = "";
  String currency = kListCurrencies.first;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    HashMap<String, dynamic> map = await viewModel.getExchangeRates();
    print("MAPNYA WOI: ${map.toString()}");

    setState(() {
      currency = viewModel.getCurrency();
      btcRate = (map[kListCrypto[0]]["rate"] as double).toStringAsFixed(3);
      ethRate = (map[kListCrypto[1]]["rate"] as double).toStringAsFixed(3);
      ltcRate = (map[kListCrypto[2]]["rate"] as double).toStringAsFixed(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COYN"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CoynCard(
                        symbol: kListCrypto[0],
                        currency: viewModel.getCurrency(),
                        conversion: btcRate),
                    CoynCard(
                        symbol: kListCrypto[1],
                        currency: viewModel.getCurrency(),
                        conversion: ethRate),
                    CoynCard(
                        symbol: kListCrypto[2],
                        currency: viewModel.getCurrency(),
                        conversion: ltcRate),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: DropdownButton<String>(
                    items: kListCurrencies
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    value: currency,
                    onChanged: (String? newCurrency) {
                      viewModel.setCurrency(newCurrency ?? "USD");
                      updateUI();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CoynCard extends StatelessWidget {
  const CoynCard(
      {Key? key,
      required this.symbol,
      required this.currency,
      required this.conversion})
      : super(key: key);

  final String symbol;
  final String currency;
  final String conversion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Card(
        elevation: 2,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "1 $symbol = $conversion $currency",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
