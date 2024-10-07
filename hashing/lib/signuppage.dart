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
      //  appBar: AppBar(
      //   title: Center(child: Text("Sign Up Page"),),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
         decoration: BoxDecoration(
         gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,
          colors: [const Color.fromARGB(255, 1, 54, 47),const Color.fromARGB(255, 115, 139, 136),
          Colors.white,Colors.white,Colors.white])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 40),
              child: Text("SIGN UP",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 107, 93),
              ),),
            ),
            Container(
              height: 572,
              width: 450,
              alignment: Alignment.bottomRight,
              // margin: EdgeInsets.only(left: 35),
               decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 240, 238),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child:  Container(
                    height:545,
                    width: 337,
                    padding: EdgeInsets.only(left: 35),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 255, 253),
                  // borderRadius: BorderRadius.circular(15),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  border: Border.all(width: 0.1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade100)
                  ]
                    ),
                    child: 
                    
                    Container(
                      height: 50,
                      width: 350,
                      child: Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Text("Enter a UserName"),
                          SizedBox(height: 5,),
                          Container(
                            height: 45,
                            width: 270,
                            child: TextField(
                              controller: signUpUsername,
                              decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                              ,labelText: "username",
                              suffixIcon: Icon(Icons.perm_identity_outlined)
                              ),
                              
                            ),
                            ),
                            SizedBox(height: 28),
                            Text("Enter email"),
                            SizedBox(height: 5,),
                             Container(
                            height: 45,
                            width: 270,
                            child: TextField(
                              controller: signUpEmail,
                              decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                              ,labelText: "Email",
                              suffixIcon: Icon(Icons.email)
                              ),
                              
                            ),
                            ),
                             SizedBox(height: 28),
                          Text("Enter a password"),
                          SizedBox(height: 5,),
                          Container(
                            height: 45,
                            width: 270,
                            child: TextField(
                              controller: signUpPassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                              ,labelText: "Password",
                              suffixIcon: Icon(Icons.password_rounded)
                              ),
                              
                            ),
                            ),
                            SizedBox(height: 40),
            
                            Container(
                              padding: EdgeInsets.only(left: 35),
                              child: Container(
                                height: 37,
                                width: 140,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(255, 238, 255, 253),
                                  backgroundColor: const Color.fromARGB(255, 1, 54, 47),
                                  shape: BeveledRectangleBorder(
                                    side: BorderSide(width: 0.1,color:  const Color.fromARGB(177, 1, 18, 255),),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))
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
                                }, child: Text("SUBMIT")),
                              ),
                            )
                        ],
                      )),
                    )
                  ),
            ),
          ],
        ),
      ),
      
    );
  }
}