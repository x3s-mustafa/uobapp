// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // In order to use RepaintBoundary, RenderRepaintBoundary
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'dart:ui' as ui;
import 'dart:typed_data';

// This package is used to save screenshots to the gallery
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:myproject/Quiz/quiz.dart';
import 'package:screenshot/screenshot.dart';

class Drwaing extends StatefulWidget {
  const Drwaing({Key key}) : super(key: key);

  @override
  _DrwaingState createState() => _DrwaingState();
}

class _DrwaingState extends State<Drwaing> {
  var _key = GlobalKey();

  String _message = 'Press the button to take a screenshot';
  ScreenshotController screenshotController = ScreenshotController();

  Future _takeScreenshot() async {
    screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((capturedImage) async {

      print(capturedImage);

      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(capturedImage),
          quality: 100,
          name: 'screenshot-${DateTime.now()}.png');
      print(result);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Quiz()),
      );
    })
        .catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          // When the user taps the button
          onPressed: () async {
            // Use setState to rebuild the widget with new values.

            _takeScreenshot();

          },


          backgroundColor: Colors.indigo,
          child: Icon(Icons.save),
        ),
      ),
      body: Screenshot(
        controller: screenshotController,
        child: WebviewScaffold(url: 'https://drawingboardio.web.app/',),
      ),
    );
  }
}
