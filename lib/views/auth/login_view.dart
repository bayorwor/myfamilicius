import 'package:famliciousapp/managers/auth/auth_manager.dart';
import 'package:famliciousapp/views/auth/create_account.dart';
import 'package:famliciousapp/views/auth/forgot_password.dart';
import 'package:famliciousapp/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthManager _authManager = AuthManager();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Image.asset(
              "assets/login.png",
              height: 200,
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "email is required";
                }
              },
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
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password is required";
                }
              },
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
                child: const Text("Forgot Password? reset"),
              ),
            ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : TextButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });

                        bool isSuccess = await _authManager.signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        if (isSuccess) {
                          Fluttertoast.showToast(
                              msg: "Login Successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "email or password is incorrect",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }
                    },
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
