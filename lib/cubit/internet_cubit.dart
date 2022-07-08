import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionState {                         // Создаём единственное Состояние
  final bool connected;                           // Конструктор для connected можно создать через Quick Fix в VS Code
  MyConnectionState(this.connected);              // connected в конструкторе — не обязатлеьный параметр и идёт без required
}

class ConnectionCubit extends Cubit<MyConnectionState> {          // Реализация Cubit
  late StreamSubscription<ConnectivityResult> _subscription;
  ConnectionCubit() : super(MyConnectionState(false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      emit(MyConnectionState(result != ConnectivityResult.none));
    });
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}