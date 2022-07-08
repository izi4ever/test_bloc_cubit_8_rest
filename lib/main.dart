import 'package:flutter/material.dart';
import 'package:test_bloc_cubit_8_rest/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',                // Заголовок приложения в операционной системе
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),                     // Виджет тела основного экрана
    );
  }
}