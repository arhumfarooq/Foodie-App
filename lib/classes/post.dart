import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie/classes/accept.dart';
import 'package:foodie/classes/utils.dart';
import 'package:foodie/containers/nn.dart';
import 'package:foodie/screens/cart.dart';
import 'package:foodie/screens/explore.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final postcontroller = TextEditingController();
  final imagecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final databaseref = FirebaseDatabase.instance.ref("All");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextField(
              controller: postcontroller,
              decoration: InputDecoration(
                  hintText: "name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: imagecontroller,
              decoration: InputDecoration(
                  hintText: "image", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: pricecontroller,
              decoration: InputDecoration(
                  hintText: "price", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  databaseref
                      .child(DateTime.now().millisecondsSinceEpoch.toString())
                      .set({
                    "title": postcontroller.text.toString(),
                    "price": pricecontroller.text.toString(),
                    "image": imagecontroller.text.toString(),
                    "id": DateTime.now().millisecondsSinceEpoch.toString()
                  }).then((value) {
                    Utils().toastmessage("Post addes");
                  }).onError((error, stackTrace) {
                    Utils().toastmessage(error.toString());
                  });
                },
                child: Text("ad")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Explore()));
                },
                child: Text("scren")),
          ],
        ),
      ),
    );
  }
}
