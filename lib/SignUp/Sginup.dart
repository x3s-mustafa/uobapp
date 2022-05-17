import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as dateo;

import '../Login/Login.dart';

var fullname = TextEditingController();
var  university_email = TextEditingController();
var  deparment = TextEditingController();
var  stage = TextEditingController();
var  phone = TextEditingController();
var    password = TextEditingController();
var   province   = TextEditingController();
var   aera = TextEditingController();
var   studentidcard = TextEditingController();
class Sginup extends StatefulWidget {
  const Sginup({Key key}) : super(key: key);

  @override
  _SginupState createState() => _SginupState();
}

class _SginupState extends State<Sginup> {

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();


  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      Add_user();
      _btnController.success();



    });

   await new Future.delayed(const Duration(seconds: 4));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Login()),
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


        var url = Uri.parse('http://97.74.90.39:4000/app/add/users');
        Map<String, String> headers = {"Content-type": "application/json"};
        String json =
            '{"UNIVERSITY": "U.O.B",'
            ' "USERNAME": "${university_email.text}",'
            ' "PASSWORD": "${password.text}",'
            ' "FULL_NAME": "${fullname.text}",'
            ' "ID_CARD": "${studentidcard.text}",'
            ' "TYPE": "Student",'
            ' "EMAIL": "${university_email.text}",'
            ' "PHONE": "${phone.text}",'
            ' "DEPARTMENT": "${deparment.text}",'
            ' "STAGE": "${stage.text}",'
            ' "TIME2": "${formattedDate2}",'
            ' "photo": "non",'
            ' "idphoto": "non"}';
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
                "Welcome in U.O.B App",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Login or Create new Account :)",
                style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 20,left: 30,right: 30),
              child:  TextField(
                style: TextStyle(color: Colors.black),
                controller: fullname,
                decoration: InputDecoration(
                  labelText: "Student Name",
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
                controller: university_email,
                decoration: InputDecoration(
                  labelText: "University Email",
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
                controller: deparment,
                decoration: InputDecoration(
                  labelText: "Department",
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
                controller: stage,
                decoration: InputDecoration(
                  labelText: "Stage",
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
                controller: phone,
                decoration: InputDecoration(
                  labelText: "Phone",
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
                  labelText: "Password",
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
                controller: province,
                decoration: InputDecoration(
                  labelText: "Province",
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
                controller: aera,
                decoration: InputDecoration(
                  labelText: "Area",
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
                controller: aera,
                decoration: InputDecoration(
                  labelText: "Student ID Card",
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
                  child: Text('Sign up', style: TextStyle(color: Colors.white)),
                  controller: _btnController,
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
      ),
    );
  }



}
