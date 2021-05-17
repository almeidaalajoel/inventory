import 'dart:io' as io;

import 'package:flutter/widgets.dart';

Widget getImage(String file) {
  io.File filez;
  try {
    filez = io.File(file);
  } catch (e1) {
    print(e1);
    return Text('No Image Found');
  }
  if (filez.existsSync()) return Image.file(filez);
  return Text('No Image Found');
}
