import 'package:flutter/material.dart';
import '../data/painting.dart';
import '../data/painting_dao.dart';
import '../pages/painting_page.dart';
import 'dart:io' as io;
import 'image.dart';

class Preview extends StatelessWidget {
  final Painting painting;
  final PaintingDao paintingDao;
  Preview(this.painting, this.paintingDao);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
            height: 200,
            child: getImage(painting.mainImage),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Text(
                      '${painting.title}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    painting.available == 'true'
                        ? Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '\u2713',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  '${painting.startDate}',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'Exhibit: ${painting.exhibit}',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '${painting.available}',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
