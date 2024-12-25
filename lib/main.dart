import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie/checkout.dart';
import 'package:foodie/classes/post.dart';
import 'package:foodie/containers/nn.dart';
import 'package:foodie/containers/order.dart';
import 'package:foodie/containers/ss.dart';
import 'package:foodie/navigation/aa.dart';
import 'package:foodie/navigation/bb.dart';
import 'package:foodie/screens/cart.dart';
import 'package:foodie/screens/explore.dart';
import 'package:foodie/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodie/signup.dart';
import 'firebase_options.dart';

//import 'package:foodie/homescreen.dart';

import 'package:foodie/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseDatabase.instance.databaseURL =
      "https://foodie-4ae69-default-rtdb.firebaseio.com";

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
