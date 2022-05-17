import 'package:flutter/material.dart';
import 'package:myproject/Quiz/quiz.dart';
import 'Auth/Auth.dart';
import 'Home/Home.dart';
import 'List/Youtube.dart';
import 'List/materils.dart';
import 'List/sourcs.dart';
import 'Login/Login.dart';
import 'Quiz/Draw.dart';
import 'Quiz/drwaing.dart';
import 'SignUp/Sginup.dart';
import 'SplashScreen/SplashScrren.dart';
import 'admin/admin.dart';
import 'admin/admin_add_materils.dart';
import 'admin/admin_add_topic.dart';


main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}