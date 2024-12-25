import 'package:flutter/material.dart';
import 'package:foodie/checkout.dart';
import 'package:foodie/classes/dd.dart';
import 'package:foodie/global/global.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int calculateTotalQuantity() {
    int totalQuantity = 0;
    for (int i = 0; i < cart.length; i++) {
      totalQuantity += cart[i].quantity; // Add quantity of each item
    }
    return totalQuantity;
  }

  double calculatetotal() {
    double total = 0.0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].quantity * cart[i].price; // Add quantity of each item
    }
    return total;
  }

  bool isNetworkImage(String path) {
    // Check if the path is a URL (network image)
    return path.startsWith('http://') || path.startsWith('https://');
  }

  //int quantity = 1; // Add a quantity variable

  // void _increaseQuantity() {
  //   setState(() {
  //     quantity++;
  //   });
  // }

  // void _decreaseQuantity() {
  //   setState(() {
  //     if (quantity > 1) {
  //       quantity--;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(0, 0, 0, 71).withOpacity(1.0),
      body: Column(
        children: [
          // SizedBox(height: 50),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
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
                                  child: isNetworkImage(item.image)
                                      ? Image.network(
                                          item.image,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(Icons.error,
                                                color: Colors.red);
                                          },
                                        )
                                      : Image.asset(
                                          item.image,
                                          fit: BoxFit.cover,
                                        )
                                  //
                                  // Image.asset(
                                  //   item.image,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  ),
                              SizedBox(width: 20),
                              // Text and price section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Japanese",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffC7C7C7),
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                                        '\$${item.price}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffC7C7C7),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        cart.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xffC7C7C7)
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Remove",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add to cart button
                                ],
                              ),
                              // Add and Remove buttons with Quantity
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Add button
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                  // Display quantity
                                  // Text(
                                  //   item.quantity, // Display the current quantity
                                  //   style: TextStyle(color: Colors.white),
                                  // ),
                                  // Remove button
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 1) item.quantity--;
                                      });
                                    },
                                    icon:
                                        Icon(Icons.remove, color: Colors.white),
                                  ),
                                ],
                              ),
                              // Expanded(
                              //   child: IconButton(
                              //     onPressed: () {
                              //       setState(() {
                              //         cart.removeAt(index);
                              //       });
                              //     },
                              //     icon: Icon(Icons.delete_forever_rounded),
                              //     color: Color(0xffC7C7C7),
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 0,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2), // Border ka color
                        width: 2.0, // Border ki width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Checkout",
                              style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Quantity",
                                  style: GoogleFonts.inter(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${calculateTotalQuantity()}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Cost",
                                  style: GoogleFonts.inter(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Text(
                                  '\$${calculatetotal().toStringAsFixed(2)}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Checkout()));
                              },
                              child: Container(
                                width: 353,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(176, 6, 35, 97),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xffC7C7C7)
                                            .withOpacity(0.6))),
                                child: Center(
                                  child: Text(
                                    "Confirmed Order",
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
