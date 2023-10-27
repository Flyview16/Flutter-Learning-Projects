import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io'
    show
        Platform; //Show is used to give access to only the platform class in this file

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItem = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItem.add(newItem);
    }
    return DropdownButton<String>(
      dropdownColor: Colors.lightBlue,
      value: selectedCurrency,
      items: dropdownItem,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency =
                value!; // !-sign added to value because onchanged argument value expects null in some cases.
            // This tells compiler that value is not null at the point of usage.
            getData();
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 50.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItem,
    );
  }

  //A map of coin type and price
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  //Getting price of coin and assigning it to coinvalue map
  void getData() async {
    isWaiting = true;
    try {
      var price = await CoinData().getCoinPrice(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = price;
      });
    } catch (e) {
      print(e);
    }
  }

  //Creating card widgets for each crypto coin

  Column makeCards() {
    List<CoinCard> coinCard = [];
    for (String crypto in cryptoList) {
      coinCard.add(
        CoinCard(
          coinType: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: coinCard,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Calling getData function whenever Stateful widget is rendeered for the first time
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0174ed),
        centerTitle: true,
        title: const Text(
          '🤑💲 Coin Ticker',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            //Platform class is used to check which platform is running on your device
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

//A stateless widget to be called on for each coin type

class CoinCard extends StatelessWidget {
  const CoinCard({this.value, this.selectedCurrency, this.coinType});

  final value;
  final selectedCurrency;
  final coinType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coinType = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
