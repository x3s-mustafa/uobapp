

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

import '../Home/Home.dart';
import '../admin/admin.dart';

class adminnots extends StatefulWidget {
  const adminnots({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<adminnots> {
  var  university_email = TextEditingController();
  var  password = TextEditingController();

  Future _User(user,text) async {


    SharedPreferences prefs = await SharedPreferences.getInstance();


    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    String formattedDate2 = DateFormat('dd/MM/yyyy HH:mm').format(now);

    // set up POST request arguments
    var url = Uri.parse('http://97.74.90.39:4000/app/add/notifactions');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"USERNAME": "${user}", "FROM_USERNAME": "${prefs.getString("USERNAME")}", "TIME2": "${formattedDate2}", "DES": "${text}"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    var name1 = data["data"];
    var C = "${data["code"]}" ;

    print(data);
    if(C == "204"){

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

              title: Center(child: Text('Incorrect entries',style: TextStyle(fontFamily: 'bukra'),),),

              backgroundColor: Colors.white,


              content:Container(
                height: 180,
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
                        child: Icon(Icons.error,size: 70 ,color: Colors.red,),
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
                          "Please check your username or password.",
                          style: TextStyle(color: Colors.black,fontFamily: 'bukra'),textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                  ],
                ),
              )

          );
        },
      );



    }else if (C == "200") {







    }








  }

  Future Wallt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var DEPARTMENT = prefs.getString("DEPARTMENT");

    var STAGE = prefs.getString("STAGE");


    if(university_email.text == ""){
      for(var i = 0 ; i < prefs.getStringList("FULL_NAMES").length;i++) {

        if( equals('${prefs.getStringList("DEPARTMENTS")[i]}', DEPARTMENT)){

          if(equals('${prefs.getStringList("STAGES")[i]}', STAGE)) {

            _User(prefs.getStringList("USERNAMES")[i],password.text);
            Load_notifactions(prefs.getStringList("PHONES")[i],password.text);

          }
        }
      }

    }

    if(university_email.text != ""){
      for(var i = 0 ; i < prefs.getStringList("FULL_NAMES").length;i++) {

        if( equals('${prefs.getStringList("DEPARTMENTS")[i]}', DEPARTMENT)){

          if(equals('${prefs.getStringList("STAGES")[i]}', STAGE)) {

            if(equals('${prefs.getStringList("FULL_NAMES")[i]}', university_email.text)) {
              _User(prefs.getStringList("USERNAMES")[i],password.text);
              Load_notifactions(prefs.getStringList("PHONES")[i],password.text);

            }


          }
        }
      }

    }






















    // TODO convert json to object...
  }

  Future Load_notifactions(phone,text) async {


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        SharedPreferences prefs = await SharedPreferences.getInstance();







        var url = Uri.parse('http://97.74.90.39:8080/send/+964${phone}/${text}');
        Map<String, String> headers = {"Content-type": "application/json"};

        Response response = await get(url);

        int statusCode = response.statusCode;

        String body = response.body;

        print(body);




      }

    } on SocketException catch (_) {

    }




    // TODO convert json to object...
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(child: Image.asset("assets/images/logo.png",height: 100,width: 100,alignment: Alignment.center,)),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "University of Baghdad",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Send Notifications",
              style: TextStyle(color: Colors.grey,fontSize: 12),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 20,left: 30,right: 30),
            child:  TextField(
              style: TextStyle(color: Colors.black),
              controller: university_email,
              decoration: InputDecoration(
                labelText: "Full Name",
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
                labelText: "Text",
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
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.indigo),
                  onPressed: () async{


                   await Wallt();
                   Navigator.pop(context);

                  },
                  child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 12),)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 20),
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
