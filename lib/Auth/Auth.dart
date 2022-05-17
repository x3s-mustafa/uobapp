import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login/Login.dart';
import '../SignUp/Sginup.dart';

class Auth extends StatefulWidget {
  const Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
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

          Padding(
            padding: EdgeInsets.only(top: 75),
            child:  Container(
              height: 50,
              width: 220,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.indigo),
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Login()),
                    );
                  },
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 12),)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child:  Container(
              height: 50,
              width: 220,
              child: OutlinedButton(


                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Sginup()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ), child: Text("Sign up",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
