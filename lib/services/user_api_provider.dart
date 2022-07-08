import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserProvider {
  // Реализуем метод, который будет получать список пользователей по REST API
  Future<List<User>> getUsers() async {          // Он возвращает Future список. Где User — наша модель <<<<<<<<<<
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();      // Важно .toList() поставить после двойных скобок ))
    } else {
      throw Exception('Error fetching users');
    }
  }
}