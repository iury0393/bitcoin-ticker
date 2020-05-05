import 'package:bitcoin_ticker/utilities/constants.dart';
import 'networking.dart';

const apiKey = 'YOUR-API-KEY-HERE';
const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinModel {
  Future<dynamic> getExchange(String currency) async {
    Map<String, String> cryptoPrices;

    for (String crypto in kCryptoList) {
      NetworkHelper networkHelper =
          NetworkHelper('$coinAPIUrl/$crypto/$currency?apikey=$apiKey');
      var coinData = await networkHelper.getData();
      var lastPrice = coinData['rate'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    }

    return cryptoPrices;
  }
}
