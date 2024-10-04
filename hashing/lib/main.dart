import 'package:flutter/material.dart';
import 'package:hashing/homepage.dart';
import 'package:hashing/loginpage.dart';
import 'package:hashing/signuppage.dart';

void main() {
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
