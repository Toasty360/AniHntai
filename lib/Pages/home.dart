import 'package:flutter/material.dart';
import 'package:valkin/services/movieAPI.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => fetchURL().then((value) {
                  print(value);
                }),
            child: Text("Click")),
      ),
    );
  }
}
