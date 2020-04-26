import 'networking.dart';

const apiKey = 'YOUR-API-KEY-HERE';
const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinModel {
  Future<dynamic> getExchange(String currency) async {
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //TODO 5: Return a Map of the results instead of a single value.
    NetworkHelper networkHelper =
        NetworkHelper('$coinAPIUrl/BTC/$currency?apikey=$apiKey');

    var coinData = await networkHelper.getData();
    var lastPrice = coinData['rate'];
    return lastPrice;
  }
}
