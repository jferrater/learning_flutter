import 'package:flutter/material.dart';
import 'package:learning_flutter/unit_converter.dart';
import 'package:learning_flutter/unit.dart';
import 'package:meta/meta.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final IconData iconData;
  final ColorSwatch color;
  final List<Unit> units;

  const Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.iconData,
      @required this.units})
      : assert(name != null),
        assert(color != null),
        assert(iconData != null),
        assert(units != null),
        super(key: key);

  /// Navigates to the [UnitConverter].
  void _navigateToConverterScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.headline4,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: UnitConverter(
            units: units,
            color: color,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () => _navigateToConverterScreen(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconData,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
