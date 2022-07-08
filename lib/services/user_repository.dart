import 'package:test_bloc_cubit_8_rest/model/user.dart';
import 'package:test_bloc_cubit_8_rest/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();                // Переменная, которая хранит данные UserProvider
  Future<List<User>> getAllUsers() => _userProvider.getUsers();     // Метод, через который будем работать с API
}                                                                   // getUsers — написанный метод класса в UserProvider