import 'package:flutter/material.dart';
import 'package:learning_flutter/category.dart';
import 'package:learning_flutter/unit.dart';

final _backgroundColor = Colors.green[100];

/// Categories screen
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red
  ];

  Widget _buildCategoryWidgets(bool portrait, List<Widget> _categories) {
    if (portrait) {
      return ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) => _categories[index],
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories,
      );
    }
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        color: _baseColors[i],
        iconData: Icons.audiotrack,
        name: _categoryNames[i],
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(true, categories),
    );
    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
