import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [

            SizedBox(height: 55,),

            Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:  const Color.fromARGB(255, 178, 209, 236)
              ),
              child: Center(child: Icon(Icons.perm_identity_outlined,
              size: 100,color:  const Color.fromARGB(255, 2, 47, 87),),),
            ),
            Text("No Profile",style: TextStyle(
              fontSize: 11
            ),),
            SizedBox(height: 15,),
            Text("Abin krishna",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),)
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text("Home Page"),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text("WELCOME",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            letterSpacing: 3,
           color:  const Color.fromARGB(255, 2, 47, 87)
          ),),
        ),
      ),
    );
  }
}