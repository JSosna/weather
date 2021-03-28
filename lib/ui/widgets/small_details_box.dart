import 'package:flutter/material.dart';

class SmallDetailsBox extends StatelessWidget {
  final String _title;
  final Widget _value;
  final double _height;

  const SmallDetailsBox(this._title, this._value, this._height, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(maxHeight: _height),
        padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0),
        margin: EdgeInsets.all(12.0),
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