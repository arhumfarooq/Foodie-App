// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie/classes/utils.dart';
// import 'package:foodie/screens/homescreen.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Checkout extends StatefulWidget {
//   const Checkout({super.key});

//   @override
//   State<Checkout> createState() => _CheckoutState();
// }

// class _CheckoutState extends State<Checkout> {
//   final _formkey3 = GlobalKey<FormState>();
//   final namecontroller = TextEditingController();
//   final addresscontroller = TextEditingController();
//   final areacontroller = TextEditingController();
//   final codecontroller = TextEditingController();
//   final numbercontroller = TextEditingController();
//   final ref = FirebaseDatabase.instance.ref("Address");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Form(
//                 key: _formkey3,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 20),
//                           hintText: 'Full name',
//                           border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white54, width: 1)),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54)),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54))),
//                       style: TextStyle(color: Colors.white),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter your name";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 20),
//                           hintText: ' Address',
//                           border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white54, width: 1)),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54)),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54))),
//                       style: TextStyle(color: Colors.white),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter your Address";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 20),
//                           hintText: 'Area',
//                           border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white54, width: 1)),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54)),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54))),
//                       style: TextStyle(color: Colors.white),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter an area";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 20),
//                           hintText: 'Postal code',
//                           border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white54, width: 1)),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54)),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54))),
//                       style: TextStyle(color: Colors.white),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter Postal code";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 20),
//                           hintText: 'Phone Number',
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54)),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.white54)),
//                           border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white54, width: 1))),
//                       style: TextStyle(color: Colors.white),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter your phone number";
//                         }
//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 200,
//               ),
//               InkWell(
//                 onTap: () {
//                   if (_formkey3.currentState!.validate()) {
//                     // Show a message before navigating
//                     ref
//                         .child(
//                             (DateTime.now().millisecondsSinceEpoch.toString()))
//                         .set({
//                       'title': namecontroller.text.toString(),
//                       'address': addresscontroller.text.toString(),
//                       'area': areacontroller.text.toString(),
//                       'postalcode': codecontroller.text.toString(),
//                       'number': numbercontroller.text.toString(),
//                       "id": (DateTime.now().millisecondsSinceEpoch.toString())
//                     }).then((value) {
//                       Utils().toastmessage("Order accepted");
//                     });

//                     // Delay for 3 seconds, show the message, then navigate to the home screen
//                     Future.delayed(const Duration(seconds: 3), () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Homescreen()),
//                       );
//                     });
//                   } else {
//                     Utils().toastmessage("Please complete all fields.");
//                   }
//                 },
//                 child: Container(
//                   width: 353,
//                   height: 45,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(176, 6, 35, 97),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                           color: Color(0xffC7C7C7).withOpacity(0.6))),
//                   child: Center(
//                     child: Text(
//                       "Order now",
//                       style: GoogleFonts.roboto(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie/classes/utils.dart';
import 'package:foodie/screens/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the input fields
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final codeController = TextEditingController();
  final numberController = TextEditingController();

  // Firebase database reference
  final ref = FirebaseDatabase.instance.ref("Address");

  @override
  void dispose() {
    // Dispose controllers to free resources
    nameController.dispose();
    addressController.dispose();
    areaController.dispose();
    codeController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    // Full Name Field
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Full name',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white54, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Address Field
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Address',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white54, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Area Field
                    TextFormField(
                      controller: areaController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Area',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white54, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter an area";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Postal Code Field
                    TextFormField(
                      controller: codeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Postal code',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white54, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Postal code";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Phone Number Field
                    TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white54, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your phone number";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 200),
              // Order Now Button
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .child(DateTime.now().millisecondsSinceEpoch.toString())
                        .set({
                      'title': nameController.text,
                      'address': addressController.text,
                      'area': areaController.text,
                      'postalcode': codeController.text,
                      'number': numberController.text,
                    }).then((value) {
                      Utils().toastmessage("Order accepted!");
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homescreen()),
                        );
                      });
                    }).catchError((error) {
                      Utils().toastmessage("Failed to place order: $error");
                    });
                  } else {
                    Utils().toastmessage("Please complete all fields.");
                  }
                },
                child: Container(
                  width: 353,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(176, 6, 35, 97),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffC7C7C7).withOpacity(0.6),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Order now",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
