import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unicons/unicons.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90.0),
                  child: Image.asset(
                    "assets/upload.png",
                    height: 130,
                    width: 130,
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      showBarModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 150,
                              child: Column(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon:
                                        Icon(UniconsLine.camera_plus, size: 35),
                                    label: Text("Take from camera"),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(UniconsLine.image, size: 35),
                                    label: Text("Select from gallery"),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    icon: Icon(UniconsLine.camera),
                    label: Text("Upload profile picture")),
                SizedBox(height: 30.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "full name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 26.0),
                TextButton(
                  onPressed: () {},
                  child: Text("Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
