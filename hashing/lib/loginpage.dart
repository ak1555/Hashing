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




            // void tologin(){
            //   bool? isValid;
              
            //  String signname= loginPassword.text;
            //  var z =hashpassword(loginPassword.text);
            //  List li=[];
            //  int index=0;
            //  int gblind=0;
            //  int subindex=0;
            //  int s=0;
            //   if (mybox.get(1)!=null){
            //     li=mybox.get(1);
            //     print(li);
            //     print(z);
            //     for(int i=0;i<=li.length;i++){
            //       String x=li[index]["password"];
            //       for(int j=0;j<=x.length;j++){
            //         if(x[subindex]==z[subindex]){
            //           // print("$j same$x===$z");
            //           isValid=true;
            //           gblind=index;
            //         }else{
            //           // print("wrong password");
            //           isValid=false;
            //           break;
            //         }
            //         subindex++;
            //       }

            //       index++;
            //     }
            //     if(isValid==true){
            //       String n = li[gblind]["username"];
            //       String m= loginUserName.text;
            //       for(int k =0;k<=n.length;k++){
            //           if(n[s]==m[s]){
            //             isValid_name=true;
            //           }else{
            //             isValid_name=false;
            //           }
            //           s++;
            //       }
            //     }else{
            //        showDialog(context: context, builder: (context) {
            //       return AlertDialog(
            //         title: Text("OOPS!!"),
            //       );
            //     },);
            //     }
                

            //   }else{
            //     showDialog(context: context, builder: (context) {
            //       return AlertDialog(
            //         title: Text("OOPS!!"),
            //       );
            //     },);
            //   }
            // }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(
      //   title: Center(child: Text("Login Page"),),
      // ),
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
                color: Colors.blueAccent.shade700,
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(width: 1,
                            color: const Color.fromARGB(255, 2, 47, 87)))
                          ,labelText: "username",
                          enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: const Color.fromARGB(177, 1, 18, 255))
                          )
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
                          ,labelText: "Password",
                           enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: const Color.fromARGB(177, 1, 18, 255),
                            )
                          )
                          
                          ),
                          
                        ),
                        ),
                        SizedBox(height: 25),

                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 249, 252, 255),
                            shape: BeveledRectangleBorder(
                              side: BorderSide(width: 0.1,color:  const Color.fromARGB(177, 1, 18, 255),),
                              borderRadius: BorderRadius.circular(5))
                          ),
                          onPressed: () {
//  String signname= loginPassword.text;
 var z =hashpassword(loginPassword.text);
  List li=[];
   bool? isValid;
   bool? isValid_name;
   int gblind=0;
             int index=0;
             int s=0;
             int subindex=0;
                                               void p(){Navigator.pushNamed(context, "homepage");}

   void data(){
  // if(isValid==true){
                  String n = li[gblind]["username"];
                  String m= loginUserName.text;
                  for(int k =0;k<=n.length;k++){
                      if(n[s]==m[s]){
                        isValid_name=true;
                        Navigator.pushNamed(context, "homepage");
                        print("true usrnme");
                      }else{
                        isValid_name=false;
                        print("inco usernme");
                        break;
                      }
                      s++;
                  }
                // }else{
                //    showDialog(context: context, builder: (context) {
                //   return AlertDialog(
                //     title: Text("OOPS!!"),
                //   );
                // },);
                // }
      
}
// tologin();

              if (mybox.get(1)!=null){
                li=mybox.get(1);
                print(li);
                print(z);
                for(int i=0;i<=li.length;i++){
                  String x=li[index]["password"];
                  for(int j=0;j<=x.length;j++){
                    if(x[subindex]==z[subindex]){
                      print("true password");
                      // print("$j same$x===$z");
                      // Navigator.pushNamed(context, "homepage");
                      data();
                      if(isValid_name==true){
                        // Navigator.pushNamed(context, "homepage");
                        p();
                      }else{
                        print("incorrect username or password");
                         showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("OOPS!!"),
                    content: Text("Incorrect UserName or password"),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, "loginpage");
                      }, child: Text("data"))
                    ],
                  );
                },);
                      }
                    }else{
                      showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("OOPS!!"),
                    
                  );
                },);
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
                    content: Text("No accounts!!!"),
                  );
                },);
              }



if(isValid==true&&isValid_name==true){
  Navigator.pushNamed(context, "homepage");
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
              }, child: Text("SIGNUP",style: TextStyle(
                color:  const Color.fromARGB(177, 1, 18, 255),
              ),))


            ],
          ),
        ),
      ),
    );
  }
}