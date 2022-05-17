import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:myproject/sharedata.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../List/sourcs.dart';
import 'Draw.dart';
import 'drwaing.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Future Ready() async{
    await new Future.delayed(const Duration(seconds: 2));

    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.reload();




  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Ready();



  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => soures(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => soures(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 100,
          padding: EdgeInsets.all(20),
          child: Container(
            height: 50,
            width: 100,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.indigo),
                onPressed: (){


                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Draw(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );



                },
                child: Text("Paint",style: TextStyle(color: Colors.white,fontSize: 12),)
            ),
          ),
        ),
        body: WebviewScaffold(url: "$examurl",clearCache: true),
      ),
    );
  }
}
