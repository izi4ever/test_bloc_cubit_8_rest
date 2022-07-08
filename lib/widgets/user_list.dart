import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Users are loaded')));
        }
      }),
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(child: Text('No data received. Pleas, press Load button'));
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text('ID: ${state.loadedUser[index].id}'),
                title: Column(
                  children: [
                    Text('Name: ${state.loadedUser[index].name}'),
                    Text('email: ${state.loadedUser[index].email}'),
                    Text('phone: ${state.loadedUser[index].phone}')
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return Center(child: Text('Error fetching users'));
        }
        return const SizedBox.shrink();           // <<< ВАЖНО!!!, т.к. данный метод должен что-то вернуть по умолчанию
      },
    );
  }
}