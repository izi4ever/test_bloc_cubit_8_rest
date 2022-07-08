import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_cubit_8_rest/bloc/user_event.dart';
import 'package:test_bloc_cubit_8_rest/cubit/internet_cubit.dart';

import '../bloc/user_bloc.dart';
import '../services/user_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository)..add(UserLoadEvent()),
        ),
        BlocProvider(create: (context) => ConnectionCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ConnectionCubit, MyConnectionState>(
            builder: (context, state) => state.connected
              ? const Text('Интернет подключен')
              : const Text('Нет интернета'),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}