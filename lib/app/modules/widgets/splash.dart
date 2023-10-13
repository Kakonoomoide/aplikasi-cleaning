import 'dart:async';
import 'package:final_project_2023/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds : 3), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => LoginView())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 148, 203, 127),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "./lib/assets/logo/trash.png",
              width: 150,
              height: 150,
            ),
            Text(
              "D'CLEAN",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
