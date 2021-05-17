//import 'package:flutter/material.dart';
import 'data/painting.dart';
import 'data/painting_dao.dart';
import 'pages/show.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macos_ui/src/library.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'Flutter Demo',
      home: Scaffold(
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return Show();
            },
          ),
        ],
        //? Submission(widget.paintingDao)Show()
        //? PaintingPage(paintingList[0])
      ),
    );
  }
}
