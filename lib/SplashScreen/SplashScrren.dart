import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/Auth.dart';
import '../Home/Home.dart';
import '../admin/admin.dart';

class Splash extends StatefulWidget {


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future Load_USERS() async {


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        SharedPreferences prefs = await SharedPreferences.getInstance();

        // USER
        List<String> UNIVERSITY = List<String>();
        List<String> USERNAME = List<String>();
        List<String> FULL_NAME = List<String>();
        List<String> ID_CARD = List<String>();
        List<String> TYPE = List<String>();
        List<String> DEPARTMENT = List<String>();
        List<String> STAGE = List<String>();
        List<String> PHONE = List<String>();



        var url = Uri.parse('http://97.74.90.39:4000/app/users');
        Map<String, String> headers = {"Content-type": "application/json"};

        Response response = await get(url);

        int statusCode = response.statusCode;

        String body = response.body;
        List<dynamic> list2 = jsonDecode(body);
        print(list2);
        setState(() {
          for(var i = 0 ; i < list2.length;i++){


            FULL_NAME.add(list2[i]['FULL_NAME']);
            DEPARTMENT.add(list2[i]['DEPARTMENT']);
            STAGE.add(list2[i]['STAGE']);
            TYPE.add(list2[i]['TYPE']);
            USERNAME.add(list2[i]['USERNAME']);
            PHONE.add(list2[i]['PHONE']);
            if(list2[i]['USERNAME'] == prefs.getString("email") && list2[i]['password'] == prefs.getString("password")){
              prefs.setString('check', "yes");
              break;

            }else{

              prefs.setString('check', "no");

            }




          }

          prefs.setStringList("FULL_NAMES", FULL_NAME);
          prefs.setStringList("DEPARTMENTS", DEPARTMENT);
          prefs.setStringList("STAGES", STAGE);
          prefs.setStringList("TYPES", TYPE);
          prefs.setStringList("USERNAMES", USERNAME);
          prefs.setStringList("PHONES", PHONE);
        });






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

  Future Load_schedules() async {


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        SharedPreferences prefs = await SharedPreferences.getInstance();


        // schedules
        List<String> schedules_UNIVERSITY = List<String>();
        List<String> schedules_SUBJECT_NAME = List<String>();
        List<String> schedules_SUBJECT_DEPARTMENT = List<String>();
        List<String> schedules_SUBJECT_STAGE = List<String>();
        List<String> schedules_SUBJECT_DAY = List<String>();
        List<String> schedules_SUBJECT_time = List<String>();





        var url = Uri.parse('http://97.74.90.39:4000/app/schedules');

        Map<String, String> headers = {"Content-type": "application/json"};

        Response response = await get(url);

        int statusCode = response.statusCode;

        String body = response.body;
        List<dynamic> list2 = jsonDecode(body);
        print(list2);
        setState(() {
          for(var i = 0 ; i < list2.length;i++){

            schedules_UNIVERSITY.add(list2[i]['UNIVERSITY']);
            schedules_SUBJECT_NAME.add(list2[i]['SUBJECT_NAME'] );
            schedules_SUBJECT_DEPARTMENT.add(list2[i]['DEPARTMENT']);
            schedules_SUBJECT_STAGE.add(list2[i]['STAGE']);
            schedules_SUBJECT_DAY.add(list2[i]['DAY']);
            schedules_SUBJECT_time.add(list2[i]['TIME2']);



          };
        });

        prefs.setStringList("schedules_UNIVERSITY", schedules_UNIVERSITY);
        prefs.setStringList("schedules_SUBJECT_NAME", schedules_SUBJECT_NAME);
        prefs.setStringList("schedules_SUBJECT_DEPARTMENT", schedules_SUBJECT_DEPARTMENT);
        prefs.setStringList("schedules_SUBJECT_STAGE", schedules_SUBJECT_STAGE);
        prefs.setStringList("schedules_SUBJECT_DAY", schedules_SUBJECT_DAY);
        prefs.setStringList("schedules_SUBJECT_time", schedules_SUBJECT_time);



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

  Future Load_Topic() async {


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        SharedPreferences prefs = await SharedPreferences.getInstance();



        // SUBJECT
        List<String> SUBJECT_NAME = List<String>();
        List<String> TOPIC = List<String>();
        List<String> SUB_TOPIC = List<String>();
        List<String> LINK = List<String>();
        List<String> PDF = List<String>();
        List<String> exam = List<String>();







        var url = Uri.parse('http://97.74.90.39:4000/app/sub_subjects');

        Map<String, String> headers = {"Content-type": "application/json"};

        Response response = await get(url);

        int statusCode = response.statusCode;

        String body = response.body;
        List<dynamic> list2 = jsonDecode(body);
        print(list2);
        setState(() {
          for(var i = 0 ; i < list2.length;i++){

            SUBJECT_NAME.add(list2[i]['SUBJECT_NAME']);
            TOPIC.add(list2[i]['TOPIC'] );
            SUB_TOPIC.add(list2[i]['SUB_TOPIC']);
            LINK.add(list2[i]['LINK']);
            PDF.add(list2[i]['PDF']);
            exam.add(list2[i]['exam']);



          };
        });

        prefs.setStringList("Topic_NAME", SUBJECT_NAME);
        prefs.setStringList("TOPIC", TOPIC);
        prefs.setStringList("SUB_TOPIC", SUB_TOPIC);
        prefs.setStringList("LINK", LINK);
        prefs.setStringList("PDF", PDF);
        prefs.setStringList("exam", exam);





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

  Future Load_notifactions() async {


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        SharedPreferences prefs = await SharedPreferences.getInstance();



        // notifactions
        List<String> notifactions_USERNAME = List<String>();
        List<String> notifactions_FROM_USERNAME = List<String>();
        List<String> notifactions_DES = List<String>();
        List<String> notifactions_TIME2 = List<String>();





        var url = Uri.parse('http://97.74.90.39:4000/app/notifactions');
        Map<String, String> headers = {"Content-type": "application/json"};

        Response response = await get(url);

        int statusCode = response.statusCode;

        String body = response.body;
        List<dynamic> list2 = jsonDecode(body);
        print(list2);
        setState(() {
          for(var i = 0 ; i < list2.length;i++){

            notifactions_USERNAME.add(list2[i]['USERNAME']);
            notifactions_FROM_USERNAME.add(list2[i]['FROM_USERNAME'] );
            notifactions_DES.add(list2[i]['DES']);
            notifactions_TIME2.add(list2[i]['TIME2']);



          };
        });

        prefs.setStringList("notifactions_USERNAME", notifactions_USERNAME);
        prefs.setStringList("notifactions_FROM_USERNAME", notifactions_FROM_USERNAME);
        prefs.setStringList("notifactions_DES", notifactions_DES);
        prefs.setStringList("notifactions_TIME2", notifactions_TIME2);




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

  Future Go()async {

    SharedPreferences prefs = await SharedPreferences.getInstance();


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print(' connected');

        await Load_USERS();
        await Load_schedules();
        await Load_SUBJECT();
        await  Load_Topic();
        await Load_notifactions();

        if(prefs.getString("check") == "yes"){


          if(prefs.getString("TYPE") == "admin"){

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => admin()));

          }else{

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()));

          }

        }else{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Auth()),
          );

        }

      }
    } on SocketException catch (_) {
      print('not connected');
      await new Future.delayed(const Duration(seconds:1));
      if(prefs.getString("check") == "yes"){


        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()));

      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Auth()),
        );

      }


    }


  }

  Future Ready() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await new Future.delayed(const Duration(seconds: 2));

    if(prefs.getString("check") == "yes"){


      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()));

    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Auth()),
      );

    }


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Go();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png",height: 100,width: 100,),
      ),
    );
  }}

