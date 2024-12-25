// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie/classes/dd.dart';
// import 'package:foodie/global/global.dart';
// import 'package:foodie/screens/cart.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Accept extends StatefulWidget {
//   const Accept({super.key});

//   @override
//   State<Accept> createState() => _AcceptState();
// }

// class _AcceptState extends State<Accept> {
//   void addToCart(String name, double price, String imagePath) {
//     setState(() {
//       // Check if the item is already in the cart
//       int index = cart.indexWhere((item) => item.name == name);
//       if (index != -1) {
//         cart[index].quantity++; // Increase quantity if already in cart
//       } else {
//         cart.add(Classitem(name: name, price: price, image: imagePath));
//       }
//     });
//   }

//   final ref = FirebaseDatabase.instance.ref("All");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("hello"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: FirebaseAnimatedList(
//                   query: ref,
//                   itemBuilder: (context, snapshot, animation, index) {
//                     final productName =
//                         snapshot.child('title').value?.toString() ?? "Unknown";
//                     final productImage =
//                         snapshot.child('image').value?.toString() ?? "";
//                     final productPrice =
//                         snapshot.child('price').value?.toString() ?? "0.0";

//                     return Container(
//                       width: 360,
//                       height: 140,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.grey, width: 1),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Image section
//                                 Container(
//                                   height: 80,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Image.asset(
//                                     productImage,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 SizedBox(width: 20),
//                                 // Text and price section
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       productName,
//                                       style: GoogleFonts.roboto(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Japanese",
//                                           style: GoogleFonts.roboto(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xffC7C7C7),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 30,
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             addToCart(
//                                                 productName,
//                                                 double.tryParse(productPrice) ??
//                                                     0.0,
//                                                 productImage);
//                                           },
//                                           child: Container(
//                                             height: 30,
//                                             width: 100,
//                                             decoration: BoxDecoration(
//                                               color:
//                                                   Colors.black.withOpacity(0.1),
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                               border: Border.all(
//                                                 color: Color(0xffC7C7C7)
//                                                     .withOpacity(0.6),
//                                               ),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 "Add to cart",
//                                                 style: GoogleFonts.roboto(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),

//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Price :",
//                                           style: GoogleFonts.roboto(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xffC7C7C7),
//                                           ),
//                                         ),
//                                         Text(
//                                           productPrice,
//                                           style: GoogleFonts.roboto(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xffC7C7C7),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 10),
//                                     // Add to cart button
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 // Add and Remove buttons with Quantity
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   })),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Cart()));
//               },
//               child: Text("s"))
//         ],
//       ),
//     );
//   }
// }
