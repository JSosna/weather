import 'package:flutter/material.dart';

class LargeDetailsBox extends StatelessWidget {
  final String _title;
  final Widget _value;
  final double _height;

  const LargeDetailsBox(this._title, this._value, this._height, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(maxHeight: _height),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FittedBox(
            child: Text(
              _title.toUpperCase(),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          _value
        ]),
      ),
    );
  }
}