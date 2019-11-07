import 'package:bitcoin_ticker/services/network.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  CoinCard({
    @required this.coin,
    @required this.currency,
  });

  final String coin;
  final String currency;

  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  double price;

  String coin;
  String currency;

  @override
  void didUpdateWidget(CoinCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    coin = widget.coin;
    currency = widget.currency;

    () async {
      Network network = Network(coin: coin, currency: currency);
      dynamic coinData = await network.getCoinData();

      setState(() {
        price = coinData['last'];
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 ${widget.coin} = ${price} ${widget.currency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
