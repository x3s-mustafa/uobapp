import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:myproject/sharedata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

import '../Quiz/quiz.dart';
import 'Youtube.dart';
var pdf = "";
var youtube = "";
var exam = "";

class soures extends StatefulWidget {
  const soures({Key key}) : super(key: key);

  @override
  _souresState createState() => _souresState();
}

class _souresState extends State<soures> {

  Future Wallt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();








    setState(() {






      for(var i = 0 ; i < prefs.getStringList("SUB_TOPIC").length;i++) {






        if( equals('${prefs.getStringList("SUB_TOPIC")[i]}', subtopicname)){


          pdf = prefs.getStringList("PDF")[i];
          youtube = prefs.getStringList("LINK")[i];
          exam = prefs.getStringList("exam")[i];








        }








      }






    });


    // TODO convert json to object...
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Wallt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 65),child: Align(
            alignment: Alignment.center,
            child: Container(

              child: Center(
                child: Text("$Subjectname - $topicname - $subtopicname",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width -50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.teal,
              ),
            ),
          ),),

          Padding(padding: EdgeInsets.only(top: 30)),
          Bounce(child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(

                  height: 80,
                  width: (MediaQuery.of(context).size.width) - 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.white,




                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 25,
                              child: Icon(Icons.book,color: Colors.white,size: 25,),
                            ),
                            Padding(padding: EdgeInsets.only(left: 10),child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(bottom: 10,),child:  Text("$subtopicname",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                                Text("PDF",style: TextStyle(color: Color(0xff00C76B),fontSize: 16,fontWeight: FontWeight.w500),),

                              ],
                            ),)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
          ),
            duration: Duration(milliseconds: 110),
            onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                  builder: (_) => PDFViewerCachedFromUrl(
                url: '$pdf',
              ),
              ));
            },
          ),
         Bounce(child:  Align(
             alignment: Alignment.center,
             child: Padding(
               padding: EdgeInsets.only(top: 20),
               child: Container(

                 height: 80,
                 width: (MediaQuery.of(context).size.width) - 25,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(25),
                   gradient: LinearGradient(
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight,
                     colors: [
                       Colors.white,
                       Colors.white,




                     ],
                   ),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.1),
                       spreadRadius: 2,
                       blurRadius: 10,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],
                 ),
                 child: Padding(
                   padding: EdgeInsets.only(left: 15),
                   child: Stack(
                     children: [
                       Row(
                         children: [
                           CircleAvatar(
                             backgroundColor: Colors.red,
                             radius: 25,
                             child: Icon(Icons.video_collection_rounded,color: Colors.white,size: 25,),
                           ),
                           Padding(padding: EdgeInsets.only(left: 10),child:  Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Padding(padding: EdgeInsets.only(bottom: 10,),child:  Text("$subtopicname",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                               Text("Youtube",style: TextStyle(color: Color(0xff00C76B),fontSize: 16,fontWeight: FontWeight.w500),),

                             ],
                           ),)
                         ],
                       ),

                     ],
                   ),
                 ),
               ),
             )
         ),
           duration: Duration(milliseconds: 110),
           onPressed: (){

           youtube_url = youtube;
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) =>  Youtube()),
             );

           },
         ),
          Bounce(child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(

                  height: 80,
                  width: (MediaQuery.of(context).size.width) - 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.white,




                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              radius: 25,
                              child: Icon(Icons.book_outlined,color: Colors.white,size: 25,),
                            ),
                            Padding(padding: EdgeInsets.only(left: 10),child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(bottom: 10,),child:  Text("$subtopicname",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                                Text("Exam",style: TextStyle(color: Color(0xff00C76B),fontSize: 16,fontWeight: FontWeight.w500),),

                              ],
                            ),)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
          ),
            duration: Duration(milliseconds: 110),
            onPressed: (){

            examurl = exam;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Quiz()),
              );

            },
          ),


        ],
      ),
    );
  }
}
class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({Key key,  this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}