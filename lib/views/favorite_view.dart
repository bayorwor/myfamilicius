import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Text('Home'),
      ),
      body: Stack(children: [
        Container(
          color: Colors.redAccent,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4 - 100,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                      )),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4 - 150,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: CircleAvatar(
            backgroundColor: Color(0xFFFE7D2B),
            foregroundColor: Colors.white,
            radius: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\$200.00"),
                Text("Total"),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
