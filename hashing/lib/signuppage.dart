import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    TextEditingController signUpUsername = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

final mybox=Hive.box('mybox');
  List ls=[];

  void hashpwd(){
    var x = hashpassword(signUpPassword.text);
    print(x);

    String uname=signUpUsername.text;
   
    if(mybox.get(1)!=null){
      setState(() {
        ls=mybox.get(1);
      });
      ls.add(
         {
        "username":uname,
        "password":x
      }
      );
      mybox.put(1, ls);
    }else{
       ls.add(
      {
        "username":uname,
        "password":x
      }
    );
      mybox.put(1, ls);
    }
  }


  String hashpassword(psd){
    var byte=utf8.encode(psd);
    // print(byte);
    var data=sha256.convert(byte);
    return data.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(child: Text("Sign Up Page"),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child:  Container(
                height:350,
                width: double.infinity,
                child: 
                
                Container(
                  height: 50,
                  width: 350,
                  child: Expanded(child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 25),
                      Text("Enter a UserName"),
                      SizedBox(height: 5,),
                      Container(
                        height: 45,
                        width: 200,
                        child: TextField(
                          controller: signUpUsername,
                          decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                          ,labelText: "username"
                          ),
                          
                        ),
                        ),
                        SizedBox(height: 15),
                        Text("Enter email"),
                        SizedBox(height: 5,),
                         Container(
                        height: 45,
                        width: 200,
                        child: TextField(
                          controller: signUpEmail,
                          decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                          ,labelText: "Email"
                          ),
                          
                        ),
                        ),
                         SizedBox(height: 15),
                      Text("Enter a password"),
                      SizedBox(height: 5,),
                      Container(
                        height: 45,
                        width: 200,
                        child: TextField(
                          controller: signUpPassword,
                          decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                          ,labelText: "Password"
                          ),
                          
                        ),
                        ),
                        SizedBox(height: 30),

                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue.shade50,
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))
                          ),
                          onPressed: () {
                          String usrnme=signUpUsername.text;
                          String pwd=signUpPassword.text;
                          if(usrnme!=""&&pwd!=""){
hashpwd();
                          }else{
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: Text("OOPS!!"),
                              );
                            },);
                          }
                        }, child: Text("SUBMIT"))
                    ],
                  )),
                )
              ),
        ),
      ),
      
    );
  }
}