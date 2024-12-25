import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:foodie/classes/dd.dart';
import 'package:foodie/global/global.dart';
import 'package:foodie/screens/cart.dart';
import 'package:google_fonts/google_fonts.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final searchcontroller = TextEditingController();

  void addToCart(String name, double price, String imagePath) {
    setState(() {
      // Check if the item is already in the cart
      int index = cart.indexWhere((item) => item.name == name);
      if (index != -1) {
        cart[index].quantity++; // Increase quantity if already in cart
      } else {
        cart.add(Classitem(name: name, price: price, image: imagePath));
      }
    });
  }

  final ref = FirebaseDatabase.instance.ref("All");

  bool isNetworkImage(String path) {
    // Check if the path is a URL (network image)
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
        centerTitle: true,
        title: Text(
          'Deliver Favourite Food',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: searchcontroller,
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
            onChanged: (String value) {
              setState(() {});
            },
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    final productName =
                        snapshot.child('title').value?.toString() ?? "Unknown";
                    final productImage =
                        snapshot.child('image').value?.toString() ?? "";
                    final productPrice =
                        snapshot.child('price').value?.toString() ?? "0.0";

                    if (searchcontroller.text.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: 360,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image section
                                    Container(
                                      height: 80,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: isNetworkImage(productImage)
                                          ? Image.network(
                                              productImage,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Icon(Icons.error,
                                                    color: Colors.red);
                                              },
                                            )
                                          : Image.asset(
                                              productImage,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    SizedBox(width: 20),
                                    // Text and price section
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productName,
                                          style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Japanese",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC7C7C7),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                addToCart(
                                                    productName,
                                                    double.tryParse(
                                                            productPrice) ??
                                                        0.0,
                                                    productImage);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: Color(0xffC7C7C7)
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Add to cart",
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price :",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC7C7C7),
                                              ),
                                            ),
                                            Text(
                                              "\$$productPrice",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC7C7C7),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Add and Remove buttons with Quantity
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (productName.toLowerCase().contains(
                        searchcontroller.text.toLowerCase().toLowerCase())) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: 360,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image section
                                    Container(
                                      height: 80,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: isNetworkImage(productImage)
                                          ? Image.network(
                                              productImage,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Icon(Icons.error,
                                                    color: Colors.red);
                                              },
                                            )
                                          : Image.asset(
                                              productImage,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    SizedBox(width: 20),
                                    // Text and price section
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productName,
                                          style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Japanese",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC7C7C7),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                addToCart(
                                                    productName,
                                                    double.tryParse(
                                                            productPrice) ??
                                                        0.0,
                                                    productImage);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: Color(0xffC7C7C7)
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Add to cart",
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price :",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC7C7C7),
                                              ),
                                            ),
                                            Text(
                                              "\$$productPrice",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC7C7C7),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Add and Remove buttons with Quantity
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })),
        ],
      ),
    );
  }
}
