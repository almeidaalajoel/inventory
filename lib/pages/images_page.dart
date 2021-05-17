import 'package:flutter/material.dart';
import 'dart:io' as io;

class ImagesPage extends StatefulWidget {
  final String mainImage;
  final io.Directory directory;
  final bool hasDirectory;
  ImagesPage(this.mainImage, this.directory, this.hasDirectory);
  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  List<io.File> files = [];

  @override
  void initState() {
    super.initState();
    if (widget.hasDirectory) {
      directories(widget.directory).then((ff) {
        setState(() {
          files = ff;
        });
      });
    }
  }

  Future<List<io.File>> directories(io.Directory directory) async {
    List<io.File> files = [];
    await for (var entity
        in directory.list(recursive: false, followLinks: false)) {
      files.add(entity);
    }
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back')),
          SizedBox(
            height: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: !widget.hasDirectory
                  ? [Text('No Folder Selected')]
                  : List<Widget>.generate(files.length, (i) {
                      return SizedBox(width: 900, child: Image.file(files[i]));
                    }),
            ),
          ),
        ],
      ),
    );
  }
}
