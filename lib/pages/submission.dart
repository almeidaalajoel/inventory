import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/painting_dao.dart';
import '../components/field.dart';
import '../components/header.dart';
import '../data/painting.dart';
import 'package:macos_ui/macos_ui.dart' as mac;

class Submission extends StatefulWidget {
  final PaintingDao paintingDao;
  final bool updating;
  final Painting painting;
  Submission(this.paintingDao, this.updating, this.painting);

  @override
  _SubmissionState createState() => _SubmissionState();
}

class _SubmissionState extends State<Submission> {
  final titlecontroller = TextEditingController();
  final trackingcontroller = TextEditingController();
  final datecontroller = TextEditingController();
  final dimensionscontroller = TextEditingController();
  final framecontroller = TextEditingController();
  final canvascontroller = TextEditingController();
  final notescontroller = TextEditingController();
  final durationcontroller = TextEditingController();
  final destinationcontroller = TextEditingController();
  final exhibitcontroller = TextEditingController();
  final retailcontroller = TextEditingController();
  final statuscontroller = TextEditingController();
  final salecontroller = TextEditingController();
  final saledatecontroller = TextEditingController();
  final paymentdatecontroller = TextEditingController();
  final clientcontroller = TextEditingController();
  final shippingdatecontroller = TextEditingController();
  final shippingcostcontroller = TextEditingController();
  final shippingmethodcontroller = TextEditingController();
  final packagingcontroller = TextEditingController();
  final imagecontroller = TextEditingController();
  final imagescontroller = TextEditingController();
  bool checked;

  @override
  void initState() {
    super.initState();
    if (widget.painting.id == null || widget.painting.available == 'false')
      checked = false;
    else if (widget.painting.available == 'true') checked = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .2,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go Back')),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  'New Entry',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(height: 50),
          Expanded(
            child: ListView(
              addAutomaticKeepAlives: true,
              children: <Widget>[
                Header('Main Information'),
                Field(
                  'Title',
                  titlecontroller,
                  defaulttext: checkNull(widget.painting.title),
                ),
                Field(
                  'Exhibit',
                  exhibitcontroller,
                  defaulttext: checkNull(widget.painting.exhibit),
                ),
                Field(
                  'Main Image',
                  imagecontroller,
                  defaulttext: checkNull(widget.painting.mainImage),
                ),
                Field(
                  'Images Folder',
                  imagescontroller,
                  defaulttext: checkNull(widget.painting.images),
                ),
                Field(
                  'Tracking #',
                  trackingcontroller,
                  defaulttext: checkNull(widget.painting.tracking),
                ),
                Field(
                  'Status',
                  statuscontroller,
                  defaulttext: checkNull(widget.painting.status),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                        child: Text('Available:'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Center(
                          child: SizedBox(
                            child: mac.Checkbox(
                              value: checked,
                              onChanged: (bool value) {
                                setState(() {
                                  checked = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Header('Dates'),
                Field('Start Date', datecontroller,
                    defaulttext:
                        DateFormat('yyyy-MM-dd ').format(DateTime.now())),
                Field(
                  'Sale Date',
                  saledatecontroller,
                  defaulttext: checkNull(widget.painting.saleDate),
                ),
                Field(
                  'Payment Date',
                  paymentdatecontroller,
                  defaulttext: checkNull(widget.painting.paymentDate),
                ),
                Field(
                  'Shipping Date',
                  shippingdatecontroller,
                  defaulttext: checkNull(widget.painting.shippingDate),
                ),
                Field(
                  'Duration',
                  durationcontroller,
                  defaulttext: checkNull(widget.painting.duration),
                ),
                Header('Specifications'),
                Field(
                  'Dimensions',
                  dimensionscontroller,
                  defaulttext: checkNull(widget.painting.dimensions),
                ),
                Field(
                  'Frame',
                  framecontroller,
                  defaulttext: checkNull(widget.painting.frame),
                ),
                Field(
                  'Canvas',
                  canvascontroller,
                  defaulttext: checkNull(widget.painting.canvas),
                ),
                Header('Pricing'),
                Field(
                  'Retail Price',
                  retailcontroller,
                  defaulttext: checkNull(widget.painting.retail),
                ),
                Field(
                  'Sale Price',
                  salecontroller,
                  defaulttext: checkNull(widget.painting.salePrice),
                ),
                Header('Client'),
                Field(
                  'Destination',
                  destinationcontroller,
                  defaulttext: checkNull(widget.painting.destination),
                ),
                Field(
                  'Client Info',
                  clientcontroller,
                  defaulttext: checkNull(widget.painting.client),
                ),
                Header('Shipping'),
                Field(
                  'Shipping Cost',
                  shippingcostcontroller,
                  defaulttext: checkNull(widget.painting.shippingCost),
                ),
                Field(
                  'Shipping Method',
                  shippingmethodcontroller,
                  defaulttext: checkNull(widget.painting.shippingMethod),
                ),
                Field(
                  'Packaging',
                  packagingcontroller,
                  defaulttext: checkNull(widget.painting.packaging),
                ),
                Field(
                  'Notes',
                  notescontroller,
                  defaulttext: checkNull(widget.painting.notes),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: Text('Submit'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String checkNull(String s) {
    if (widget.painting.id == null)
      return '';
    else
      return s;
  }

  void _submit() async {
    Painting painting;
    painting = Painting(
      added: DateTime.now().toString(),
      available: checked.toString(),
      canvas: canvascontroller.text,
      client: clientcontroller.text,
      destination: destinationcontroller.text,
      dimensions: dimensionscontroller.text,
      duration: durationcontroller.text,
      exhibit: exhibitcontroller.text,
      frame: framecontroller.text,
      images: imagescontroller.text,
      mainImage: imagecontroller.text,
      notes: notescontroller.text,
      packaging: packagingcontroller.text,
      paymentDate: paymentdatecontroller.text,
      retail: retailcontroller.text,
      saleDate: saledatecontroller.text,
      salePrice: salecontroller.text,
      shippingCost: shippingcostcontroller.text,
      shippingDate: shippingdatecontroller.text,
      shippingMethod: shippingmethodcontroller.text,
      startDate: datecontroller.text,
      status: statuscontroller.text,
      title: titlecontroller.text,
      tracking: trackingcontroller.text,
    );
    painting.id = widget.painting.id;
    if (!widget.updating) {
      await widget.paintingDao.insert(painting);
    } else {
      painting.added = widget.painting.added;
      await widget.paintingDao.update(painting);
    }
    Navigator.pop(context, widget.paintingDao.getAllSortedByAdded());
  }
}
