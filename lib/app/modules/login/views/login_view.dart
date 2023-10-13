import 'package:final_project_2023/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:final_project_2023/app/modules/home/views/home_view.dart';
import 'package:final_project_2023/app/modules/login/views/signup.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:final_project_2023/app/modules/login/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _loginState();
}

class _loginState extends State<LoginView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 190,
                    child: Image.asset(
                      "./lib/assets/logo/login.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                    "Masukan Email dan Password Anda",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          label: Text('Email'),
                          hintText: "Masukan Email Anda",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email harus diisi";
                          }
                          return null;
                        },
                        onChanged: (newValue) {
                          if (newValue != null) {
                            email = newValue;
                          }
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Password"),
                          hintText: "Masukan Password anda",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password harus diisi";
                          }
                          return null;
                        },
                        onChanged: (newValue) {
                          if (newValue != null) {
                            Password = newValue;
                          }
                        }),
                  ),
                  Padding(padding: EdgeInsets.all(0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: Password);
                          Get.put(UserController());
                          Get.snackbar(
                              'Berhasil',
                              'Berhasil Login',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Color.fromARGB(124, 76, 175, 79),
                              colorText: Colors.white,
                              duration: Duration(seconds: 3),
                              margin: EdgeInsets.all(10),
                              borderRadius: 10,
                            );
                          Get.offAll(HomeView());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 111, 173, 113),
                            fixedSize: Size(80, 40)),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async{
                       Get.put(UserController());
                       Get.offAll(SignUp());
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 111, 173, 113),
                        fixedSize: Size(80, 40)),
                  ),
                ],
              ))),
    );
  }
}
