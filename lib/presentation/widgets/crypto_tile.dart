import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:symfonia_test/data/models/crypto.dart';
import 'package:intl/intl.dart';

class CryptoTile extends StatelessWidget {
  const CryptoTile({Key? key, required this.data}) : super(key: key);

  final Crypto data;

  // this method formats the date returned from the api
  String getFormattedDate(String date) {
    var inputDate = DateTime.parse(date.toString());
    var outputFormat = DateFormat('hh:mm, MMM d, y');//MM/dd/yyyy
    var outputDate = outputFormat.format(inputDate);
    return outputDate;

  }

  //this method returns the color of the market cap percentage change gotten from the api request
  Color getColor(String str){
    if(str[0] == '-'){
      return Colors.red;
    }
    return Colors.green;
  }
  @override
  Widget build(BuildContext context) {
    // this variable stores the value of the market cap percentage change gotten from the api request
    final String marketCapPer24h = data.marketCapChangePercentage24h.toString();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: SizedBox(
              height: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: CachedNetworkImage(
                  imageUrl: data.image,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Text(
                  '\$${data.currentPrice.toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  getFormattedDate(data.lastUpdated),
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '$marketCapPer24h%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: getColor(marketCapPer24h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

