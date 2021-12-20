import 'package:famliciousapp/views/auth/create_account.dart';
import 'package:famliciousapp/views/auth/forgot_password.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Image.asset(
              "assets/login.png",
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ),
                ),
                child: Text("Forgot Password? reset"),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Login",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 26.0),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateAccount()));
              },
              child: Text("I am new here? New account"),
            ),
          ],
        ),
      ),
    ));
  }
}
