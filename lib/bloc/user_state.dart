import 'package:test_bloc_cubit_8_rest/model/user.dart';

abstract class UserState {}                     // Общий абстрактный класс, группирующий все состояния ниже

class UserEmptyState extends UserState {}       // Состояние, когда список пользователей пустой или данные отсутствуют

class UserLoadingState extends UserState {}     // Состояние, когда данные находятся в процессе загрузки

class UserLoadedState extends UserState {
  List<User> loadedUser;                        // Сюда нужно передать наших загруженных пользователей. Это будет List<User>
  UserLoadedState({                             // Создаём конструктор для loadedUser. Можно через CMD + .
    required this.loadedUser,                   // Обязательный параметр
  });
}

class UserErrorState extends UserState {}       // Состояние, когда при загрузке данных произошла ошибка