// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff00000080).withOpacity(0.5),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   color: Color.fromARGB(249, 15, 3, 82),
//                 ),
//                 SizedBox(height: 500), // Placeholder for scrollable content
//               ],
//             ),
//             Positioned(
//               top: 80,
//               left: 20,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.menu),
//                     color: Colors.white,
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Delivery",
//                         style: GoogleFonts.roboto(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey.shade600,
//                         ),
//                       ),
//                       Text(
//                         "Maplewood Suites",
//                         style: GoogleFonts.roboto(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 30),
//                   Image.asset("assets/Control.png"),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 170,
//               left: 20,
//               right: 20,
//               child: TextField(
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color(0xff00000080).withOpacity(0.5),
//                   hintText: "Your order",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   suffixIcon: Icon(
//                     Icons.qr_code_scanner_outlined,
//                     color: Colors.grey,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey, width: 1),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 230,
//               left: 20,
//               right: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Categories',
//                     style: GoogleFonts.roboto(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 17,
//                       color: Colors.white,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'See all',
//                       style: GoogleFonts.roboto(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 15,
//                         color: Color(0xffC7C7C7),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 280,
//               left: 20,
//               right: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 80,
//                         width: 80,
//                         child: Card(
//                           color: Color.fromARGB(255, 23, 42, 95),
//                           child:
//                               Center(child: Image.asset('assets/burger 1.png')),
//                         ),
//                       ),
//                       Text(
//                         'Burgers',
//                         style: GoogleFonts.roboto(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 80,
//                         width: 80,
//                         child: Card(
//                           color: Color.fromARGB(255, 23, 42, 95),
//                           child:
//                               Center(child: Image.asset('assets/cake 1.png')),
//                         ),
//                       ),
//                       Text(
//                         'Dessert',
//                         style: GoogleFonts.roboto(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 80,
//                         width: 80,
//                         child: Card(
//                           color: Color.fromARGB(255, 23, 42, 95),
//                           child:
//                               Center(child: Image.asset('assets/taco 1.png')),
//                         ),
//                       ),
//                       Text(
//                         'Mexican',
//                         style: GoogleFonts.roboto(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 80,
//                         width: 80,
//                         child: Card(
//                           color: Color.fromARGB(255, 23, 42, 95),
//                           child: Center(child: Image.asset('assets/ull.png')),
//                         ),
//                       ),
//                       Text(
//                         'Sushi',
//                         style: GoogleFonts.roboto(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 420,
//               left: 2,
//               right: 20,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: InkWell(
//                   onTap: () {
//                     print("arhum");
//                   },
//                   child: Image.asset('assets/Card.png'),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 20,
//               right: 20,
//               top: 630,
//               child: Text(
//                 "Fastest near you",
//                 style: GoogleFonts.roboto(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 420,
//               left: 2,
//               right: 20,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: InkWell(
//                   onTap: () {
//                     print("arhum");
//                   },
//                   child: Image.asset('assets/Card.png'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/classes/utils.dart';
import 'package:foodie/login.dart';
import 'package:foodie/navigation/aa.dart';
import 'package:foodie/screens/cart.dart';
import 'package:foodie/screens/explore.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_pin_sharp, color: Colors.white),
              title: Text(
                'Personal Information',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 470,
            ),
            InkWell(
              onTap: () {
                auth.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false,
                  );
                }).catchError((error) {
                  Utils().toastmessage(error.toString());
                });
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Color.fromARGB(176, 6, 35, 97),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Color(0xffC7C7C7).withOpacity(0.6))),
                child: Center(
                  child: Text(
                    "Logout",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the drawer icon color here
        ),
        backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
        centerTitle: true,
        title: Text(
          'ROOF YARD',
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: const Color.fromARGB(249, 15, 3, 82),
                ),
              ],
            ),
            SizedBox(height: 800),
            Positioned(
              top: 20,
              left: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        "Maplewood Suites",
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Image.asset("assets/Control.png"),
                ],
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff00000080).withOpacity(0.5),
                  hintText: "Your order",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: const Icon(
                    Icons.qr_code_scanner_outlined,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Explore()));
                    },
                    child: Text(
                      'See all',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: const Color(0xffC7C7C7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 230,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Card(
                          color: const Color.fromARGB(255, 23, 42, 95),
                          child:
                              Center(child: Image.asset('assets/burger 1.png')),
                        ),
                      ),
                      Text(
                        'Burgers',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Card(
                          color: const Color.fromARGB(255, 23, 42, 95),
                          child:
                              Center(child: Image.asset('assets/cake 1.png')),
                        ),
                      ),
                      Text(
                        'Dessert',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Card(
                          color: const Color.fromARGB(255, 23, 42, 95),
                          child:
                              Center(child: Image.asset('assets/taco 1.png')),
                        ),
                      ),
                      Text(
                        'Mexican',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Card(
                          color: const Color.fromARGB(255, 23, 42, 95),
                          child: Center(child: Image.asset('assets/ull.png')),
                        ),
                      ),
                      Text(
                        'Sushi',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 350,
              left: 2,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    print("arhum");
                  },
                  child: Image.asset('assets/Card.png'),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 560,
              child: Text(
                "Fastest near you",
                style: GoogleFonts.roboto(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 2,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Aa()));
                  },
                  child: Image.asset('assets/card1.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
