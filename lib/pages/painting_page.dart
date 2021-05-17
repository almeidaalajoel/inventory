import 'package:flutter/material.dart';
import 'package:inventory/pages/images_page.dart';
import '../data/painting.dart';
import '../data/painting_dao.dart';
import '../components/attribute.dart';
import 'submission.dart';
import 'dart:io' as io;
import '../components/image.dart';

class PaintingPage extends StatelessWidget {
  final Painting painting;
  final PaintingDao paintingDao;
  PaintingPage(this.painting, this.paintingDao);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Go back')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Submission(paintingDao, true, painting)));
                        Navigator.pop(context, result);
                      },
                      child: Text('Edit')),
                ],
              ),
              Attribute(
                  "available", painting.available == 'true' ? 'yes' : 'no'),
              Attribute("canvas", painting.canvas),
              Attribute("client", painting.client),
              Attribute("destination", painting.destination),
              Attribute("dimensions", painting.dimensions),
              Attribute("duration", painting.duration),
              Attribute("exhibit", painting.exhibit),
              Attribute("frame", painting.frame),
              Attribute("notes", painting.notes),
              Attribute("packaging", painting.packaging),
              Attribute("paymentDate", painting.paymentDate),
              Attribute("retail", painting.retail),
              Attribute("saleDate", painting.saleDate),
              Attribute("salePrice", painting.salePrice),
              Attribute("shippingCost", painting.shippingCost),
              Attribute("shippingDate", painting.shippingDate),
              Attribute("shippingMethod", painting.shippingMethod),
              Attribute("startDate", painting.startDate),
              Attribute("status", painting.status),
              Attribute("title", painting.title),
              Attribute("tracking", painting.tracking),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Delete Painting'),
                onPressed: () async {
                  await paintingDao.delete(painting);
                  Navigator.pop(context, paintingDao.getAllSortedByTitle());
                },
              ),
            ]),
            GestureDetector(
              onTap: () {
                if (painting.images != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagesPage(
                        painting.mainImage,
                        io.Directory(painting.images),
                        true,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagesPage(
                        painting.mainImage,
                        io.Directory(''),
                        false,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 70),
                height: 400,
                child: getImage(
                  painting.mainImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
