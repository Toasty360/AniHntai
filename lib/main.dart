import 'package:flutter/material.dart';
import '/Pages/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    darkTheme: ThemeData.dark(useMaterial3: true),
    home: Home(),
  ));
}
