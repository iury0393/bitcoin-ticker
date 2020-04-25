import 'networking.dart';

const apiKey = 'apikey=6E2A00B1-C020-485F-A4EB-576BE1454141';
const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinModel {
  Future<dynamic> getExchange(String currency) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinAPIUrl/BTC/$currency?$apiKey');

    var coinData = await networkHelper.getData();
    return coinData;
  }
}
