import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<T>> fetchData<T>(String apiUrl, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map<T>((data) => fromJson(data)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
