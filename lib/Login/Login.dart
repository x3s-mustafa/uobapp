import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/Home.dart';
import '../admin/admin.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var  university_email = TextEditingController();
  var  password = TextEditingController();

  Future _User() async {


    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', university_email.text);
    prefs.setString('passwrod', password.text);




    // set up POST request arguments
    var url = Uri.parse('http://97.74.90.39:4000/todo13');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "${university_email.text}", "password": "${password.text}"}';
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


      prefs.setString('UNIVERSITY', data["data"]["UNIVERSITY"] as String);
      prefs.setString('USERNAME', data["data"]["USERNAME"] as String);
      prefs.setString('PASSWORD', data["data"]["PASSWORD"] as String);
      prefs.setString('FULL_NAME', data["data"]["FULL_NAME"] as String);
      prefs.setString('ID_CARD', data["data"]["ID_CARD"] as String);
      prefs.setString('TYPE', data["data"]["TYPE"] as String);
      prefs.setString('EMAIL', data["data"]["EMAIL"] as String);
      prefs.setString('PHONE', data["data"]["PHONE"] as String);
      prefs.setString('DEPARTMENT', data["data"]["DEPARTMENT"] as String);
      prefs.setString('STAGE', data["data"]["STAGE"] as String);
      prefs.setString('TIME2', data["data"]["TIME2"] as String);




      prefs.setString('check', "yes");


      if(prefs.getString("TYPE") == "admin"){

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => admin()));

      }else{

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()));

      }




    }








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
              "Welcome in Wallet",
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
              controller: university_email,
              decoration: InputDecoration(
                labelText: "Email ID",
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

          Padding(
            padding: EdgeInsets.only(top: 75),
            child:  Container(
              height: 50,
              width: 220,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.indigo),
                  onPressed: (){


                    _User();

                  },
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 12),)
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
