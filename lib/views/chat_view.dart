// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order app'),
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 40,
        ),
        actions: [Icon(Icons.pageview_sharp, size: 40)],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: CardWidget(
                    index: 4,
                  )),
              Expanded(
                flex: 3,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    10,
                    (index) => CardWidget(
                      index: index,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://picsum.photos/250?image=${index + 10}',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('Title'),
              subtitle: Text('Subtitle'),
              trailing: Text('\$${index + 20}'),
            ),
          ),
        ],
      ),
    );
  }
}
