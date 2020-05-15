import 'package:flutter/material.dart';
import 'package:learning_flutter/category.dart';

const _categoryName = 'audio track';
const _categoryIcon = Icons.audiotrack;
const _categoryColor = Colors.green;

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
          child: Category(
            color: _categoryColor,
            name: _categoryName,
            iconData: _categoryIcon,
          ),
        ),
      ),
    );
  }
}
