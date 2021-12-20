import 'package:famliciousapp/views/auth/create_account.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                Image.asset(
                  "assets/lock.png",
                  height: 200,
                ),
                SizedBox(height: 30.0),
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
                TextButton(
                  onPressed: () {},
                  child: Text("Reset password",
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
