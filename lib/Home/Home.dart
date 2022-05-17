import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/Auth.dart';
import '../List/materils.dart';
import '../Notifactions/nots.dart';
import '../Schedule/schedule.dart';

var fullname = "Loading";
var stage;
var depart;
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future _User() async {


    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      fullname =  prefs.getString("FULL_NAME");
      stage = prefs.getString("STAGE");
      depart = prefs.getString("DEPARTMENT");
    });








  }

  Future Logout() async {


    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', "null");
    prefs.setString('passwrod', "null");

    prefs.setString('check', "no");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Auth()),
    );







  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _User();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 30,right: 30),child:   Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.notifications,size: 35,),
              onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  nots()),
                );
              },
            ),
          ),),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 50,
              child: Icon(Icons.person,color: Colors.white,size: 50,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "${fullname}",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Department: $depart - Stage: $stage",
              style: TextStyle(color: Colors.grey,fontSize: 12),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 75),
            child:  Container(
              height: 50,
              width: MediaQuery.of(context).size.width -100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.indigo),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  schedule()),
                    );
                  },
                  child: Text("Schedule",style: TextStyle(color: Colors.white,fontSize: 15),)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child:  Container(
              height: 50,
              width: MediaQuery.of(context).size.width -100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.indigo),
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  materils()),
                    );

                  },
                  child: Text("Materials",style: TextStyle(color: Colors.white,fontSize: 15),)
              ),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 40),
            child:  Container(
              height: 50,
              width: 220,
              child: OutlinedButton(


                  onPressed: () {
                    Logout();
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ), child: Text("Log out",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 45)),
          Align(child: Image.asset("assets/images/logo.png",height: 50,width: 50,alignment: Alignment.center,)),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "University of Baghdad ",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Computer Sciences Department",
              style: TextStyle(color: Colors.grey,fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
