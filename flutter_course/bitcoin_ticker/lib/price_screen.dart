import 'dart:convert';
import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';
  dynamic btcPrice;
  dynamic pricesBTC;
  dynamic pricesETH;
  dynamic pricesLTC;

  @override
  void initState() {
    getPrices();
    super.initState();
  }

  void getPrices() async {
    String urlBTC =
        'https://rest.coinapi.io/v1/exchangerate/BTC?apikey=6919E23F-935B-41BD-A3DA-2F26A74FBA94';
    // String urlETH =
    //     'https://rest.coinapi.io/v1/exchangerate/ETH?apikey=6919E23F-935B-41BD-A3DA-2F26A74FBA94';
    // String urlLTC =
    //     'https://rest.coinapi.io/v1/exchangerate/LTC?apikey=6919E23F-935B-41BD-A3DA-2F26A74FBA94';
    http.Response responseBTC = await http.get(Uri.parse(urlBTC));
    // http.Response responseETH = await http.get(Uri.parse(urlETH));
    // http.Response responseLTC = await http.get(Uri.parse(urlLTC));

    if (responseBTC.statusCode == 200) {
      String data = responseBTC.body;
      pricesBTC = jsonDecode(data);
      print(pricesBTC['rates'][0]);
    } else {
      print(responseBTC.statusCode);
    }

    // if (responseETH.statusCode == 200) {
    //   String data = responseETH.body;
    //   pricesETH = jsonDecode(data);
    // } else {
    //   print(responseETH.statusCode);
    // }

    // if (responseLTC.statusCode == 200) {
    //   String data = responseLTC.body;
    //   pricesLTC = jsonDecode(data);
    // } else {
    //   print(responseLTC.statusCode);
    // }
  }

  CupertinoPicker IOSPicker() {
    List<Text> pickerItems = [];
    for (var currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(currenciesList[selectedIndex]);
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> adnroidDropDownList() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            print(selectedCurrency);
            // print(pricesBTC[0]);
            for (var rate in pricesBTC['rates']) {
              if (rate['asset_id_quote'] == selectedCurrency) {
                btcPrice = rate['rate'];
                print(rate['rate']);
              }
            }
            // print(pricesBTC['rates']['asset_id_quote'])
            // rates[2826].asset_id_quote
          });
        });
  }

  // List<DropdownMenuItem<String>> getDropdownItems() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //   for (String currency in currenciesList) {
  //     var newItem = DropdownMenuItem(
  //       child: Text(currency),
  //       value: currency,
  //     );
  //     dropdownItems.add(newItem);
  //   }
  //   return dropdownItems;
  // }

  // List<Text> getPickerItems() {
  //   List<Text> pickerItems = [];
  //   for (var currency in currenciesList) {
  //     var newItem = Text(currency);
  //     pickerItems.add(newItem);
  //   }
  //   return pickerItems;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btcPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? IOSPicker() : adnroidDropDownList(),
          ),
        ],
      ),
    );
  }
}
