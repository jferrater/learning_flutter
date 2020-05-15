import 'package:flutter/material.dart';
import 'package:learning_flutter/category_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Track',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: CategoryRoute(),
        ),
      ),
    );
  }
}
