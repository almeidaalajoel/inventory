import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String name;

  const Header(this.name);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .5,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
