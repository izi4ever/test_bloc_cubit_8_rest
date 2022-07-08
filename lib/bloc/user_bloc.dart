import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_event.dart';                    // Все импорты подключать автоматически по мере написания кода
import '../bloc/user_state.dart';
import '../services/user_repository.dart';
import '../model/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(                  // ПЕРВОЕ СОБЫТИЕ
      (event, emit) async {
        emit(UserLoadingState());

        try {
          final List<User> loadUserList = await userRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<UserClearEvent>(                 // ВТОРОЕ СОБЫТИЕ
      (event, emit) async {
        emit(UserEmptyState());         // По событию UserClearEvent эмитим состояние UserEmptyState
      },
    );
  }  
}