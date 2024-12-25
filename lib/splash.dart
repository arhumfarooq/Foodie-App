import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B1225),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 300),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/frame.png',
                  height: 100,
                  width: 100,
                ),
                Text(
                  "ROOF YARD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
