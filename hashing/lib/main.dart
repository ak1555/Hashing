import 'package:flutter/material.dart';
import 'package:hashing/homepage.dart';
import 'package:hashing/loginpage.dart';
import 'package:hashing/signuppage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var mybox=await Hive.openBox('mybox');
  
  runApp(
    MaterialApp(
      // home: ,
      initialRoute:"loginpage" ,
      routes: {
        "loginpage":(context)=>LoginPage(),
        "homepage":(context)=>HomePage(),
        "signuppage":(context)=>SignUpPage(),
      },
    )
  );
}
