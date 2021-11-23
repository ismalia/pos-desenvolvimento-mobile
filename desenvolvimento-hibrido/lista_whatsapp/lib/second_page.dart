import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String contactName;
  SecondPage(this.contactName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
      ),
    );
  }
}