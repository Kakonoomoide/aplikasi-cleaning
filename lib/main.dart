import 'package:final_project_2023/app/modules/widgets/splash.dart';
import 'package:flutter/material.dart'; //
import 'package:get/get_navigation/get_navigation.dart';
import 'package:final_project_2023/app/data/token_adapter.dart'; //
import 'package:final_project_2023/app/data/hive_store.dart'; //
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

const apikey = "AIzaSyAqP4FGbo0-qGrK6Yj4v2gBbs58dOxNAAs";
const projectId = "finalproject-8bedc";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

/// gjhgjhjhgihhjjvh
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FinalApp",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
