import 'dart:convert';


import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>> getUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;

      print(data);
      return data;
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
