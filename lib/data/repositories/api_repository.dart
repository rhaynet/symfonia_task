import 'dart:convert';

import 'package:symfonia_test/data/models/crypto.dart';
import 'package:symfonia_test/data/services/api_service.dart';

class ApiRepository {
  final ApiService apiService;

  const ApiRepository({required this.apiService,});

  Future<List<Crypto>?> getCryptoList() async {

    final response = await apiService.getCryptoData();

    if(response != null){
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => Crypto.fromJson(e)).toList();
    }
  }
}
