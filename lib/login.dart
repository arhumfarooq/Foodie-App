import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/classes/utils.dart';
import 'package:foodie/containers/ss.dart';
import 'package:foodie/screens/homescreen.dart';
//import 'package:foodie/use/use1.dart';
import 'package:foodie/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _HomescreenState();
}

class _HomescreenState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  // final usernamecontroller = TextEditingController();
  final formkey3 = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((value) {
      Utils().toastmessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homescreen()));
    }).onError((error, stackTrace) {
      Utils().toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B1225),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
              height: 398,
              decoration: BoxDecoration(
                  color: Color(
                    0xff1D102D,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Form(
                      key: formkey3,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                prefix: Icon(
                                  Icons.mail_lock,
                                  color: Colors.white,
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: 'example@gmail.com',
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
                                return "Enter your email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                prefix: Icon(
                                  Icons.lock_person,
                                  color: Colors.white,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
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
                                return "Enter your password";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff402788),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
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
            SizedBox(
              height: 20,
            ),
            Text(
              'Dont have an account',
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text(
                  'REGISTER',
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


// import 'package:flutter/material.dart';

// import 'package:foodie/homescreen2.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _AuthenticationState();
// }

// class _AuthenticationState extends State<Homescreen> {
//   bool isLogin = true;
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0B1225),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: Image.asset(
//               'assets/images/frame.png',
//             ),
//           ),
//           const Text(
//             'Roof Yard',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: Text(
//               'Deliver Favourite Food',
//               style: GoogleFonts.openSans(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 24),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 30, right: 30),
//             width: double.infinity,
//             height: 400,
//             decoration: BoxDecoration(
//                 color: const Color(
//                   0xff1D102D,
//                 ),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     isLogin ? 'Login' : 'SignUp',
//                     style: GoogleFonts.openSans(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(
//                     height: 35,
//                   ),
//                   Form(
//                       child: Column(
//                     children: [
//                       if (!isLogin) ...[
//                         TextFormField(
//                           decoration: InputDecoration(
//                               prefix: const Padding(
//                                 padding: EdgeInsets.only(right: 10),
//                                 child: Icon(
//                                   Icons.person,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               hintStyle: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400),
//                               contentPadding: const EdgeInsets.only(left: 20),
//                               hintText: 'example@gmail.com',
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                   borderSide:
//                                       const BorderSide(color: Colors.white54)),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                   borderSide:
//                                       const BorderSide(color: Colors.white54))),
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                       ],
//                       TextFormField(
//                         decoration: InputDecoration(
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(right: 10),
//                               child: Icon(
//                                 Icons.person,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             hintStyle: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                             contentPadding: const EdgeInsets.only(left: 20),
//                             hintText: 'example@gmail.com',
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white54)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white54))),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                             hintStyle: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(right: 10),
//                               child: Icon(
//                                 Icons.lock_person,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             suffixIcon: const Icon(
//                               Icons.remove_red_eye_sharp,
//                               color: Colors.white,
//                             ),
//                             contentPadding: const EdgeInsets.only(left: 20),
//                             hintText: 'Password',
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white54)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white54))),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                     ],
//                   )),
//                   Visibility(
//                     visible: isLogin,
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Forget Password?',
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 20, right: 20, top: 30),
//                     child: SizedBox(
//                         height: 44,
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xff497BFFB2),
//                                 elevation: 2,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (ctx) => Homescreen2()));
//                             },
//                             child: Center(
//                                 child: Text(
//                               isLogin ? 'Login' : 'Create Account',
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             )))),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 isLogin = !isLogin;
//               });
//             },
//             child: Text(
//               isLogin ? 'Don\'t have an account?' : 'Already have an account?',
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 isLogin = !isLogin;
//               });
//             },
//             child: Text(
//               isLogin ? 'Register' : 'SignUp',
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
