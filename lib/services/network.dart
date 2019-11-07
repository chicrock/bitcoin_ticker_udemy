import 'dart:convert';

import 'package:http/http.dart' as Http;

class Network {
  final String coin;
  final String currency;

  Network({this.coin, this.currency});

  Future<dynamic> getData(String url) async {
    Http.Response response = await Http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      final responseData = jsonDecode(data);

      return responseData;
    } else {
      print('Error Occured!!');
    }
  }

  Future<dynamic> getCoinData() async {
    String url =
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$coin$currency';

    return await getData(url);
  }
}
