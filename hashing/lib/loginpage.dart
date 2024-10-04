import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  bool islogin = true;
  bool issignup = true;
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.1),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100)
            ]
          ),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Text("Login",style: TextStyle(
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
                          
                        }, child: Text("SUBMIT"))
                    ],
                  )),
                )
              ),
              // [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
               Container(
                height: issignup?70:350,
                width: double.infinity,
                child: issignup?TextButton(
                  style: TextButton.styleFrom(
                  //  maximumSize: Size(21, 30)
                  ),
                  onPressed: () {
                  setState(() {
                    issignup=false;
                    islogin=true;
                  });
                }, child: Text("SIGNUP"))
                :
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
                          decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))
                          ,labelText: "username"
                          ),
                          
                        ),
                        ),
                        SizedBox(height: 25),
                        Text("Enter a password"),
                        SizedBox(height: 5,),
                         Container(
                        height: 45,
                        width: 200,
                        child: TextField(
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
                          
                        }, child: Text("SUBMIT"))
                    ],
                  )),
                )
              )


            ],
          ),
        ),
      ),
    );
  }
}