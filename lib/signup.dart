import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/classes/utils.dart';
import 'package:foodie/containers/ss.dart';
import 'package:foodie/login.dart';

import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _Homescreen3State();
}

class _Homescreen3State extends State<Signup> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  bool isvisible = false;
  void tooglevisibilty() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B1225),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/frame.png',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ROOF YARD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Deliver Favourite Food',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                  color: Color(
                    0xff1D102D,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Signup',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: usernamecontroller,
                              decoration: InputDecoration(
                                  prefix: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Enter a username',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white54))),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a username";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                  prefix: Icon(
                                    Icons.mail_lock,
                                    color: Colors.white,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Enter a email',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white54))),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              obscureText: isvisible,
                              decoration: InputDecoration(
                                  prefix: Icon(
                                    Icons.lock_person,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      tooglevisibilty();
                                    },
                                    icon: Icon(isvisible
                                        ? Icons.remove_red_eye_sharp
                                        : Icons.remove_red_eye_outlined),
                                    color: Colors.white,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white54))),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a password";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              _auth
                                  .createUserWithEmailAndPassword(
                                      email: emailcontroller.text.toString(),
                                      password:
                                          passwordcontroller.text.toString())
                                  .then((value) {
                                Utils().toastmessage("Account created");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }).onError((error, StackTrace) {
                                Utils().toastmessage(error.toString());
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff402788),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Create an account',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Color(0xffFFFFFF)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '0r',
                        style: GoogleFonts.openSans(
                            color: Color(0xffEC2578),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image(image: AssetImage('assets/farme2.png'))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Already have an account',
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ss()));
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
