import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:myproject/List/topic.dart';
import 'package:myproject/sharedata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

var sar = TextEditingController();
var stage = [""];
var subject = [""];
var teaches = [""];
class materils extends StatefulWidget {
  const materils({Key key}) : super(key: key);

  @override
  _materilsState createState() => _materilsState();
}

class _materilsState extends State<materils> {


  Future Wallt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedDate2 = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);


    var DEPARTMENT = prefs.getString("DEPARTMENT");







    setState(() {

      stage.clear();
      subject.clear();
      teaches.clear();




      for(var i = 0 ; i < prefs.getStringList("SUBJECT_DEPARTMENT").length;i++) {






        if( equals('${prefs.getStringList("SUBJECT_DEPARTMENT")[i]}', DEPARTMENT)){



          stage.add(
              prefs.getStringList("SUBJECT_STAGE")[i]
          );

          subject.add(
              prefs.getStringList("SUBJECT_NAME")[i]

          );

          teaches.add(
              prefs.getStringList("TEACHER_USERNAME")[i]

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
                child: Text("Materils",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
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
              itemCount: stage.length,
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
                                      Padding(padding: EdgeInsets.only(bottom: 10,),child:  Text("Stage: ${stage[Index]}",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                                      Text("${subject[Index]}",style: TextStyle(color: Color(0xff00C76B),fontSize: 16,fontWeight: FontWeight.w500),),

                                    ],
                                  ),)
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(padding: EdgeInsets.only(right: 20,bottom: 15),child: Text(
                                  "${teaches[Index]}",
                                  style: TextStyle(color: Colors.grey,fontSize: 8,fontWeight: FontWeight.w400),
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                    duration: Duration(milliseconds: 110),
                    onPressed: (){

                      Subjectname = subject[Index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Topic()),
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
