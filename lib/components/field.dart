import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart' as mac;

class Field extends StatefulWidget {
  final String fieldName;
  final String defaulttext;
  final TextEditingController controller;

  const Field(this.fieldName, this.controller, {this.defaulttext = ""});

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  void initState() {
    widget.controller.text = widget.defaulttext;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .2,
            child: Text(
              widget.fieldName + ': ',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: mac.TextField(
              /*decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),*/
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}
