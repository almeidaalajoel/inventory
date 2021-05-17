import 'package:flutter/material.dart';

class Attribute extends StatelessWidget {
  final String name;
  final String data;
  Attribute(this.name, this.data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('$name: $data', textAlign: TextAlign.left),
    );
  }
}
