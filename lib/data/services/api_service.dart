import 'package:http/http.dart';

class ApiService{

  String url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
  Future<Response?> getCryptoData() async {
    try{
      final response = await get(Uri.parse(url));
      return response;
    }catch(err){
      print('Error: $err');
    }
  }
}