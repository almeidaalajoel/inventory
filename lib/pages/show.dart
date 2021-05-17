import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'submission.dart';
import 'painting_page.dart';
import '../data/painting.dart';
import '../data/painting_dao.dart';
import '../components/preview.dart';
import 'package:macos_ui/macos_ui.dart' as mac;
import 'package:macos_ui/src/library.dart';

class Show extends StatefulWidget {
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  bool checked = false;
  bool exhibits = false;
  final PaintingDao paintingDao = PaintingDao();
  List<Painting> paintingList = [];
  List<Painting> sortedList = [];

  @override
  void initState() {
    super.initState();
    paintingDao.getAllSortedByAdded().then((pList) {
      setState(() {
        paintingList = pList;
        sortedList = pList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return paintingList == null
        ? CircularProgressIndicator()
        : Scrollbar(
            isAlwaysShown: true,
            child: ListView(
              children: _makeList(context),
            ),
          );
  }

  List<Painting> sortList(List<Painting> p) {
    if (checked) {
      p = p
          .where((painting) => painting.available == checked.toString())
          .toList();
    }
    return p;
  }

  List<Widget> _makeList(BuildContext context) {
    List<Widget> list;
    Set<String> exhibitSet = {};
    if (exhibits)
      sortedList.sort((a, b) => Comparable.compare(a.exhibit, b.exhibit));
    else
      sortedList.sort((b, a) => Comparable.compare(a.added, b.added));
    list = List<Widget>.generate(sortedList.length, (i) {
      if (exhibits) {
        if (!exhibitSet.contains(sortedList[i].exhibit)) {
          exhibitSet.add(sortedList[i].exhibit);
          return Container(
            margin: EdgeInsets.only(top: i == 0 ? 20 : 100),
            child: Column(
              children: [
                Text(
                  'Exhibit: ${sortedList[i].exhibit}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                    child: Preview(sortedList[i], paintingDao),
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PaintingPage(sortedList[i], paintingDao)));
                      if (result is List<Painting>) {
                        setState(() {
                          paintingList = result;
                          sortedList = sortList(paintingList);
                        });
                      }
                    }),
              ],
            ),
          );
        }
      }

      return GestureDetector(
          child: Preview(sortedList[i], paintingDao),
          onTap: () async {
            final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PaintingPage(sortedList[i], paintingDao)));
            if (result is List<Painting>) {
              setState(() {
                paintingList = result;
                sortedList = sortList(paintingList);
              });
            }
          });
    });
    list.insert(
      0,
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Available:'),
          ),
          mac.Checkbox(
            value: checked,
            onChanged: (bool value) {
              setState(() {
                checked = value;
                sortedList = sortList(paintingList);
              });
            },
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 400,
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Submission(paintingDao, false, Painting())));
                if (result is List<Painting>) {
                  setState(() {
                    paintingList = result;
                    sortedList = sortList(paintingList);
                  });
                }
              },
              child: Text('Add Painting'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 400,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  exhibits = !exhibits;
                });
              },
              child: exhibits
                  ? Text('Sort Chronologically')
                  : Text('Sort by Exhibit'),
            ),
          ),
        ],
      ),
    );
    return list;
  }
}
