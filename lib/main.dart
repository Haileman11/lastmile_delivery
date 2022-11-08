import 'package:flutter/material.dart';

void main() {
  runApp(const LastMile());
}

class LastMile extends StatelessWidget {
  const LastMile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Mile Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Last Mile Delivery'),
        ),
      ),
    );
  }
}
