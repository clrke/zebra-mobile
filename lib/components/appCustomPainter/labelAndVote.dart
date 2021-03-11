import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_mobile/components/appCustomPainter/appCustomPainter.dart';
import 'package:zero_mobile/components/appCustomPainter/appColorButton.dart';
import 'package:zero_mobile/components/appCustomPainter/drawingArea.dart';
import 'package:zero_mobile/components/appCustomPainter/widgetToImage.dart';
import 'package:zero_mobile/constants/theme.dart';

import 'convertUtils.dart';

class LabelAndVote extends StatefulWidget {
  final String imageSource;

  LabelAndVote({
    @required this.imageSource,
  });

  @override
  _LabelAndVoteState createState() => _LabelAndVoteState(imageSource);
}

class _LabelAndVoteState extends State<LabelAndVote> {
  // For canvas to image conversion
  GlobalKey imgKey;
  Uint8List imgBytes;

  // For canvas
  List<DrawingArea> points = [];
  Color selectedColor;
  double strokeWidth;

  // Image passed into the canvas
  final String imageSource;

  // Constructor
  _LabelAndVoteState(this.imageSource);

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 5.0;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Creates image
    Widget buildImage(Uint8List bytes) =>
        bytes != null ? Image.memory(bytes) : Container();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.grey[800],
            ),
            Container(
              color: Colors.grey[800],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              this.setState(() {
                                points.clear();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: theme['primary'],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.03),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            child: Text('Undo'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final imgBytes = await ConvertUtils.capture(imgKey);
                              setState(() {
                                this.imgBytes = imgBytes;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: theme['primary'],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.03),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            child: Text('Save'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),

                      WidgetToImage(
                        builder: (key) {
                          this.imgKey = key;

                        return Container(
                            width: width * 0.95,
                            height: height * 0.45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.tealAccent,
                                width: 3.0,
                              ),
                              image: DecorationImage(
                                image: NetworkImage('$imageSource'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onPanDown: (details) {
                                this.setState(() {
                                  points.add(DrawingArea(
                                      point: details.localPosition,
                                      areaPaint: Paint()
                                        ..strokeCap = StrokeCap.round
                                        ..isAntiAlias = true
                                        ..color = selectedColor
                                        ..strokeWidth = 5.0));
                                });
                              },
                              onPanUpdate: (details) {
                                this.setState(() {
                                  points.add(DrawingArea(
                                      point: details.localPosition,
                                      areaPaint: Paint()
                                        ..strokeCap = StrokeCap.round
                                        ..isAntiAlias = true
                                        ..color = selectedColor
                                        ..strokeWidth = 5.0));
                                });
                              },
                              onPanEnd: (details) {
                                this.setState(() {
                                  points.add(null);
                                });
                              },
                              child: ClipRect(
                                  child: CustomPaint(
                                    painter: AppCustomPainter(
                                        color: selectedColor,
                                        points: points,
                                        height: height * 0.50,
                                        width: width * 0.80,
                                    ),
                                  ),
                              ),
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          width: width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ColorButton(
                                  color: Colors.red,
                                  semanticLabel: 'red',
                                  onPressed: () {
                                    this.setState(() => selectedColor = Colors.red);
                                  }),
                              ColorButton(
                                  color: Colors.green,
                                  semanticLabel: 'green',
                                  onPressed: () {
                                    this.setState(
                                            () => selectedColor = Colors.green);
                                  }),
                              ColorButton(
                                  color: Colors.brown,
                                  semanticLabel: 'brown',
                                  onPressed: () {
                                    this.setState(
                                            () => selectedColor = Colors.brown);
                                  }),
                              ColorButton(
                                  color: Colors.deepPurpleAccent,
                                  semanticLabel: 'purple',
                                  onPressed: () {
                                    this.setState(() =>
                                    selectedColor = Colors.deepPurpleAccent);
                                  }),
                              ColorButton(
                                  color: Colors.amber,
                                  semanticLabel: 'amber',
                                  onPressed: () {
                                    this.setState(
                                            () => selectedColor = Colors.amber);
                                  }),
                            ],
                          )),

                      // For Testing Purposes
                      SizedBox(height: 20.0),
                      Divider(
                        height: 2.0,
                        thickness: 2.0,
                      ),
                      SizedBox(height: 20.0),

                      Text(
                        'Exported Image',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buildImage(imgBytes),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
