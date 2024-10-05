import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginUserName = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  var mybox=Hive.box('mybox');
  bool islogin = true;
  bool issignup = true;



  // void hashpwd(){
  //   var x = hashpassword(signUpPassword.text);
  //   print(x);

  //   String uname=signUpUsername.text;
   
  //   if(mybox.get(1)!=null){
  //     setState(() {
  //       ls=mybox.get(1);
  //     });
  //     ls.add(
  //        {
  //       "username":uname,
  //       "password":x
  //     }
  //     );
  //     mybox.put(1, ls);
  //   }else{
  //      ls.add(
  //     {
  //       "username":uname,
  //       "password":x
  //     }
  //   );
  //     mybox.put(1, ls);
  //   }
  // }


  String hashpassword(psd){
    var byte=utf8.encode(psd);
    // print(byte);
    var data=sha256.convert(byte);
    return data.toString();
  }




            void tologin(){
             String signname= loginPassword.text;
             var z =hashpassword(loginPassword.text);
             List li=[];
             int index=0;
             int subindex=0;
              if (mybox.get(1)!=null){
                li=mybox.get(1);
                print(li);
                print(z);
                for(int i=0;i<=li.length;i++){
                  String x=li[index]["password"];
                  for(int j=0;j<=x.length;j++){
                    if(x[subindex]==z[subindex]){
                      print("$j same$x===$z");
                    }else{
                      print("wrong password");
                      break;
                    }
                    subindex++;
                  }

                  index++;
                }
                

              }else{
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("OOPS!!"),
                  );
                },);
              }
            }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Center(child: Text("Login Page"),),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 400,
          padding: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.1),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100)
            ]
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 15,),
              Text("WELCOME",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),

              Container(
                height: islogin?70:350,
                width: double.infinity,
                child: islogin?TextButton(
                  style: TextButton.styleFrom(
                  //  maximumSize: Size(21, 30)
                  ),
                  onPressed: () {
                  setState(() {
                    islogin=false;
                    issignup=true;
                  });
                }, child: Text("login"))
                :
                Container(
                  height: 50,
                  width: 350,
                  child: Expanded(child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 25),
                      Container(
                        height: 45,
                        width: 200,
                        child: TextField(
                          controller: loginUserName,
                          decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                          ,labelText: "username"
                          ),
                          
                        ),
                        ),
                        SizedBox(height: 25),
                         Container(
                        height: 45,
                        width: 200,
                        child: TextField(
                          controller: loginPassword,
                          decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                          ,labelText: "Password"
                          ),
                          
                        ),
                        ),
                        SizedBox(height: 25),

                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue.shade50,
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))
                          ),
                          onPressed: () {
// tologin();

 String signname= loginPassword.text;
             var z =hashpassword(loginPassword.text);
             List li=[];
             int index=0;
             int subindex=0;
              if (mybox.get(1)!=null){
                li=mybox.get(1);
                print(li);
                print(z);
                for(int i=0;i<=li.length;i++){
                  String x=li[index]["password"];
                  for(int j=0;j<=x.length;j++){
                    if(x[subindex]==z[subindex]){
                      // print("$j same$x===$z");
                      Navigator.pushNamed(context, "homepage");
                    }else{
                      print("wrong password");
                      break;
                    }
                    subindex++;
                  }

                  index++;
                }
                

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
              // [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
              Spacer(),

              TextButton(onPressed: () {
                Navigator.pushNamed(context, "signuppage");
              }, child: Text("SIGNUP"))


            ],
          ),
        ),
      ),
    );
  }
}