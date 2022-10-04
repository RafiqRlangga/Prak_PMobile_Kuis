import 'package:flutter/material.dart';
import 'package:kuis/menu_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Game',
      debugShowCheckedModeBanner: false,
      home: MenuList(),
    );
  }
}