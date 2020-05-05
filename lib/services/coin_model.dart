import 'package:bitcoin_ticker/utilities/constants.dart';
import 'networking.dart';

const apiKey = '6E2A00B1-C020-485F-A4EB-576BE1454141';
const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinModel {
  Future<dynamic> getExchange(String currency) async {
    Map<String, String> cryptoPrices = {};

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
