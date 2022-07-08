import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_cubit_8_rest/bloc/user_bloc.dart';
import 'package:test_bloc_cubit_8_rest/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(   
          onPressed: () {
            _userBloc.add(UserLoadEvent());                           // <<< Здесь
          }, 
          child: Text('Загрузить'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        SizedBox(width: 10,),
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());                          // <<< Здесь
          }, 
          child: Text('Очистить'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}