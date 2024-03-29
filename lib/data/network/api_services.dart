import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<T>> fetchData<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson) async {
    print('Loading api .....');
    final response = await http.get(Uri.parse(apiUrl));
    log(apiUrl);
    if (response.statusCode == 200) {
      print('Api Fetch completed');
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map<T>((data) => fromJson(data)).toList();
    }
    {
      throw Exception('Failed to load data');
    }
  }

  void login(String email, password) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
