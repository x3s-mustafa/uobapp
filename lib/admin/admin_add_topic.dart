import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as dateo;
import '../Login/Login.dart';
import 'admin.dart';

class addtopic extends StatefulWidget {
  const addtopic({Key key}) : super(key: key);

  @override
  _addtopicState createState() => _addtopicState();
}

var fullname = TextEditingController();
var  topic = TextEditingController();
var  subtopic = TextEditingController();
var  youtube = TextEditingController();
var  pdf = TextEditingController();
var   exam = TextEditingController();


List<BottomSheetAction> SUBJECTS= List<BottomSheetAction>();

class _addtopicState extends State<addtopic> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();


  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      Add_user();
      _btnController.success();



    });

    await new Future.delayed(const Duration(seconds: 4));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  admin()),
    );
  }

  Future Add_user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        DateTime now = DateTime.now();
        String formattedDate = dateo.DateFormat('yyyy-MM-dd').format(now);
        String formattedDate2 = dateo.DateFormat('yyyy-MM-dd HH:mm:ss').format(now);


        var url = Uri.parse('http://97.74.90.39:4000/app/add/sub_subjects');
        Map<String, String> headers = {"Content-type": "application/json"};
        String json =
            '{"SUBJECT_NAME": "${fullname.text}",'
            ' "TOPIC": "${topic.text}",'
            ' "SUB_TOPIC": "${subtopic.text}",'
            ' "LINK": "${youtube.text}",'
            ' "PDF": "${pdf.text}",'
            ' "exam": "${exam.text}",'
            ' "TIME2": "${formattedDate2}"}';
        // make POST request
        Response response = await post(url, headers: headers, body: json);
        // check the status code for the result
        int statusCode = response.statusCode;
        // this API passes back the id of the new item added to the body
        String body1 = response.body;
        var data = jsonDecode(body1);
        print(data);
        var C = data["success"] as String;





      }
    } on SocketException catch (_) {
      print('not connected');

      showDialog(

        context: context,
        builder:
            (BuildContext context) {
          return AlertDialog(

              shape: RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.all(
                      Radius.circular(
                          10.0))),

              title: Center(child: Text('Error',style: TextStyle(fontFamily: 'bukra'),),),

              backgroundColor: Colors.white,


              content: Container(
                height: 150,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 200,
                      height: 40,


                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Center(
                        child: Icon(Icons.error, size: 70, color: Colors.red,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 200,
                      height: 40,


                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Center(
                        child: Text(
                          "No Internet connection",
                          style: TextStyle(color: Colors.black,fontFamily: 'bukra'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                  ],
                ),
              )

          );
        },
      );
    }
    // set up POST request arguments


  }

  Future subjects() async {


    SharedPreferences prefs = await SharedPreferences.getInstance();

    for(var i = 0 ; i < prefs.getStringList("Topic_NAME").length;i++){
      SUBJECTS.add(


        BottomSheetAction(title:  Text('${prefs.getStringList("Topic_NAME")[i]}'), onPressed: () {
          fullname.text = "${prefs.getStringList("Topic_NAME")[i]}";
          //  email.text = "eme.19.402@student.uotechnology.edu.iq";
          Navigator.pop(context);

        }),


      );

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subjects();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: EdgeInsets.only(top: 50),
              child:Align(child: Image.asset("assets/images/logo.png",height: 100,width: 100,alignment: Alignment.center,)),

            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Add Topic",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "* Fill all this Fields",
                style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 20,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: fullname,
                readOnly: true,
                onTap: (){
                  showAdaptiveActionSheet(
                    context: context,
                    title: const Text('Select'),
                    androidBorderRadius: 30,
                    actions: SUBJECTS,
                    cancelAction: CancelAction(title: const Text('Cancel')),// onPressed parameter is optional by default will dismiss the ActionSheet
                  );
                },
                decoration: InputDecoration(
                  labelText: "Subject Name",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      )
                  ),
                ),
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 15,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: topic,
                decoration: InputDecoration(
                  labelText: "TOPIC",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      )
                  ),
                ),
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 20,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: subtopic,
                decoration: InputDecoration(
                  labelText: "SUBTOPIC",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      )
                  ),
                ),
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 15,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: youtube,
                decoration: InputDecoration(
                  labelText: "Youtube Link",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      )
                  ),
                ),
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 20,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: pdf,
                decoration: InputDecoration(
                  labelText: "PDF Link",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      )
                  ),
                ),
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 15,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: exam,
                decoration: InputDecoration(
                  labelText: "Exam Link",
                  labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.indigo,
                      )
                  ),
                ),
              ),

            ),

            Padding(
              padding: EdgeInsets.only(top: 75),
              child:  Container(
                height: 50,
                width: 220,
                child: RoundedLoadingButton(
                  child: Text('Add Topic', style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  onPressed: _doSomething,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,bottom: 50),
              child: Text(
                "Encrypted by SH1-A",
                style: TextStyle(color: Colors.grey,fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
