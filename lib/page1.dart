import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {

  String name, institute, roll, destrict;

  Page1({
    required this.name,
    required this.institute,
    required this.roll,
    required this.destrict,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name:-$name"),
            Text("Institute:-$institute"),
            Text("Roll:-$roll"),
            Text("District:-$destrict"),
          ],
        ),
      ),
    );
  }
}
