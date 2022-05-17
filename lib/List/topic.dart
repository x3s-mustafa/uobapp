import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:intl/intl.dart';
import 'package:myproject/sharedata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

import 'SubTopic.dart';
var topic = [""];
var subject = [""];
class Topic extends StatefulWidget {
  const Topic({Key key}) : super(key: key);

  @override
  _TopicState createState() => _TopicState();
}

class _TopicState extends State<Topic> {
  Future Wallt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedDate2 = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);






    setState(() {

      topic.clear();
      subject.clear();




      for(var i = 0 ; i < prefs.getStringList("Topic_NAME").length;i++) {






        if( equals('${prefs.getStringList("Topic_NAME")[i]}', Subjectname)){



          topic.add(
              prefs.getStringList("TOPIC")[i]
          );

          subject.add(
              prefs.getStringList("Topic_NAME")[i]

          );






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
                child: Text("$Subjectname",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width -50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.indigo,
              ),
            ),
          ),),


          Expanded(child: ListView.builder(
              itemCount: topic.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return new Bounce(
                  child: Align(
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
                                      backgroundColor: Colors.indigo,
                                      radius: 25,
                                      child: Icon(Icons.workspaces_filled,color: Colors.white,size: 25,),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10),child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(padding: EdgeInsets.only(bottom: 10,),child:  Text("${subject[Index]}",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                                        Text("${topic[Index]}",style: TextStyle(color: Color(0xff00C76B),fontSize: 16,fontWeight: FontWeight.w500),),

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

                    topicname = topic[Index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SubTopic()),
                    );

                  },
                );
              }
          ))
        ],
      ),
    );
  }
}
