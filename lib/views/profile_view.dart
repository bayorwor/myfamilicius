import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut() {
    _auth.signOut();
  }

  void getUser() async {
    // await _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Stack(
          children: [
            Image.network(
              'https://media.istockphoto.com/photos/headshot-portrait-of-happy-mixed-race-african-girl-wearing-glasses-picture-id1144287292?b=1&k=20&m=1144287292&s=170667a&w=0&h=fvNKa6QuUa--cNv-oUXaHUBx8deD9iWgegvn76CtG_M=',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 44,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _signOut();
                      },
                      icon: const Icon(
                        UniconsLine.sign_out_alt,
                        size: 44,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Etherianaka Brenda",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Main Account",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
