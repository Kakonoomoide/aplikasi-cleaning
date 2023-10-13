import 'package:final_project_2023/app/modules/login/views/login_view.dart';
import 'package:final_project_2023/app/modules/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:final_project_2023/app/modules/rekap/views/rekap_view.dart';
import 'package:get/get.dart';
import 'package:final_project_2023/app/modules/login/controllers/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserController userController = Get.find();
  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(const LoginView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Selamat datang, ${FirebaseAuth.instance.currentUser!.displayName}",),
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout),
            )
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 113, 173, 115),
        ),
        body: Container(
            color: const Color.fromARGB(255, 234, 243, 234),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(120),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const SearchView());
                    },
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 243, 234),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          const BoxShadow(
                            color: Color.fromARGB(255, 113, 173, 115),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(-4, -4),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "./lib/assets/logo/search.png",
                            width: 50,
                            height: 50,
                          ),
                          const Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 113, 173, 115),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Rekapan());
                    },
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 243, 234),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            const BoxShadow(
                              color: Color.fromARGB(255, 113, 173, 115),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(4, 4),
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(-4, -4),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "./lib/assets/logo/note.png",
                            width: 50,
                            height: 50,
                          ),
                          const Text(
                            "Note",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 113, 173, 115),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
