import 'package:flutter/material.dart';
import 'package:foodie/classes/dd.dart';
import 'package:foodie/global/global.dart';
import 'package:google_fonts/google_fonts.dart';

class Ss extends StatefulWidget {
  const Ss({super.key});

  @override
  State<Ss> createState() => _SsState();
}

class _SsState extends State<Ss> {
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

  int quantity = 1; // Add a quantity variable

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
      body: Column(
        children: [
          SizedBox(height: 50),
          Stack(children: [
            Container(
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
                          child: Image.asset(
                            "assets/noodles.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        // Text and price section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kinka Izakaya",
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
                                    addToCart("arhum", 2.22, "assets/eat.png");
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color:
                                            Color(0xffC7C7C7).withOpacity(0.6),
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
                                  "\$10.99",
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffC7C7C7),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Add to cart button
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Add and Remove buttons with Quantity
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
