import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'EE77CD38-40D9-409D-94CB-E1CCD18BF5F5';
const coinAPIurl = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

//Making API call to coinAPI

class CoinData {
  Future getCoinPrice(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      final Uri url = Uri.parse('$coinAPIurl/$crypto/$currency?apikey=$apiKey');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var coinPrice = decodedData['rate'];
        cryptoPrices[crypto] = coinPrice.toStringAsFixed(
            2); //AsFixed used to format number of decimal places
      } else {
        print(response.statusCode);
        throw 'Problem with get request';
      }
    }
    return cryptoPrices;
  }
}
