import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrencyService {
  static const String _apiKey = 'YOUR API KEY';
  static const String _baseUrl = 'https://api.fixer.io/latest';

  Future<Map<String, dynamic>> getExchangeRates(String baseCurrency) async {
    final Uri uri =
        Uri.parse('$_baseUrl?base=$baseCurrency&access_key=$_apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body)
          as Map<String, dynamic>; // Add type annotation here
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}
