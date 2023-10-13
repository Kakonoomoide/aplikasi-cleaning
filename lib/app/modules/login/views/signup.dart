import 'package:final_project_2023/app/modules/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_2023/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String nama;
  late String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              "SIGNUP",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
             Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Username'),
                    hintText: "Masukan Username Anda",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username harus diisi";
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    if (newValue != null) {
                      nama = newValue;
                    }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  decoration: const InputDecoration(
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    hintText: "Masukan Password Anda",
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
                      password = newValue;
                    }
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(20),
              minWidth: 250,
              child: const Text(
                "REGISTER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              color: const Color.fromARGB(255, 130, 183, 120),
              onPressed: () async {
                    final UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    final User? user = userCredential.user;
                    if (user != null) {
                      // Update the display name in Firebase
                      await user.updateProfile(displayName: nama);
                      await user.reload();
                      Get.offAll(const HomeView());
                    }
                  },
            ),
            TextButton(
              child: const Text(
                "Sudah punya akun? silahkan klik login",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
