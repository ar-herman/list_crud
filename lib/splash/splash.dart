import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listview_app/home/home_screen.dart';
import 'package:listview_app/register/regis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late SharedPreferences sharedPreferences;

  startSplashScreen() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      if (sharedPreferences.getString("email") != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Registerscreen()),
        );
      }
    });
  }

  @override
  void initState() {
    startSplashScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade900,
        child: const Center(
          child: Text(
            "List App",
            style: TextStyle(
              fontSize: 20,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
        ),
      ),
    );
  }
}
