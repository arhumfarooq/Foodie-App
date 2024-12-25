import 'package:flutter/material.dart';
import 'package:foodie/classes/dd.dart';
import 'package:foodie/global/global.dart';
import 'package:google_fonts/google_fonts.dart';

class Aa extends StatefulWidget {
  const Aa({super.key});

  @override
  State<Aa> createState() => _AaState();
}

class _AaState extends State<Aa> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset("assets/eat.png"),
                SizedBox(
                  height: 400,
                )
              ],
            ),
            Positioned(
              top: 230,
              child: Container(
                width: 360,
                height: 154,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Kinka Izakaya",
                        style: GoogleFonts.roboto(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        "Japanese",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffC7C7C7)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery fee",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffC7C7C7)),
                              ),
                              Text(
                                "\$3.99",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Food price",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffC7C7C7)),
                              ),
                              Text(
                                "\$20.99",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Food Price",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffC7C7C7)),
                              ),
                              Text(
                                "\$20.99",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Our Kinka Izakaya is a truly comforting dish\nthat features thick, chewy, handmade Kinka\nIzakaya, perfectly cooked and served in a\nrich, savory miso broth. The umami flavors\nof the miso blend harmoniously with the\nhearty texture of the Izakaya, making every\nbite satisfying and nourishing. Tofu, fresh\nspring onions, and a variety of vegetables\nare delicately added as garnishes, bringing\na burst of freshness and crunch to the dish. This bowl is the perfect balance of warmth, flavor, and texture, offering a fulfilling and delicious experience for your taste buds.",
                    style: GoogleFonts.roboto(
                        color: Color(0xffC7C7C7).withOpacity(0.6),
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                )),
            Positioned(
              top: 660,
              child: InkWell(
                onTap: () {
                  addToCart("Kinka Izakaya", 20.99, "assets/eat.png");
                },
                child: Container(
                  width: 353,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(176, 6, 35, 97),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC7C7C7).withOpacity(0.6))),
                  child: Center(
                    child: Text(
                      "Add to Basket",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
