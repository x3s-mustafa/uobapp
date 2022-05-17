
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as dateo;
import '../Login/Login.dart';
import 'admin.dart';

var fullname = TextEditingController();
var    password = TextEditingController();


class addmaterilas extends StatefulWidget {
  const addmaterilas({Key key}) : super(key: key);

  @override
  _addmaterilasState createState() => _addmaterilasState();
}

class _addmaterilasState extends State<addmaterilas> {

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  Future Load_SUBJECT() async {


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        SharedPreferences prefs = await SharedPreferences.getInstance();



        // SUBJECT
        List<String> SUBJECT_UNIVERSITY = List<String>();
        List<String> SUBJECT_NAME = List<String>();
        List<String> SUBJECT_DEPARTMENT = List<String>();
        List<String> SUBJECT_STAGE = List<String>();
        List<String> TEACHER_USERNAME = List<String>();







        var url = Uri.parse('http://97.74.90.39:4000/app/subjects');

        Map<String, String> headers = {"Content-type": "application/json"};

        Response response = await get(url);

        int statusCode = response.statusCode;

        String body = response.body;
        List<dynamic> list2 = jsonDecode(body);
        print(list2);
        setState(() {
          for(var i = 0 ; i < list2.length;i++){

            SUBJECT_UNIVERSITY.add(list2[i]['UNIVERSITY']);
            SUBJECT_NAME.add(list2[i]['SUBJECT_NAME'] );
            SUBJECT_DEPARTMENT.add(list2[i]['SUBJECT_DEPARTMENNT']);
            SUBJECT_STAGE.add(list2[i]['SUBJECT_STAGE']);
            TEACHER_USERNAME.add(list2[i]['TEACHER_USERNAME']);



          };
        });

        prefs.setStringList("SUBJECT_UNIVERSITY", SUBJECT_UNIVERSITY);
        prefs.setStringList("SUBJECT_NAME", SUBJECT_NAME);
        prefs.setStringList("SUBJECT_DEPARTMENT", SUBJECT_DEPARTMENT);
        prefs.setStringList("SUBJECT_STAGE", SUBJECT_STAGE);
        prefs.setStringList("TEACHER_USERNAME", TEACHER_USERNAME);





      }

    } on SocketException catch (_) {
      print('not connected');

      await  showDialog(

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

      exit(0);
    }




    // TODO convert json to object...
  }


  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      Add_user();
      _btnController.success();



    });
    await Load_SUBJECT();
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


        var url = Uri.parse('http://97.74.90.39:4000/app/add/subjects');
        Map<String, String> headers = {"Content-type": "application/json"};
        String json =
            '{"UNIVERSITY": "U.O.B",'
            ' "SUBJECT_NAME": "${fullname.text}",'
            ' "SUBJECT_DEPARTMENNT": "${prefs.getString("DEPARTMENT")}",'
            ' "SUBJECT_STAGE": "${prefs.getString("STAGE")}",'
            ' "TEACHER_USERNAME": "${prefs.getString("USERNAME")}",'
            ' "SUBJECT_TIME2": "${formattedDate2}"}';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              "Add new materils ",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "*Fill all this Fileds ",
              style: TextStyle(color: Colors.grey,fontSize: 12),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 20,left: 30,right: 30),
            child:  TextField(
              style: TextStyle(color: Colors.black),
              controller: fullname,
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
              controller: password,
              decoration: InputDecoration(
                labelText: "Your Password",
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
                child: Text('Add', style: TextStyle(color: Colors.white)),
                controller: _btnController,
                color: Colors.indigo,
                onPressed: _doSomething,
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
    );
  }



}
