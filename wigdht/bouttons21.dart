// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class Bouttons21 extends StatelessWidget {
  final String? name;
  final double hig;
  final double wid;
  final Function() onPresd;
  const Bouttons21({
    super.key,
    required this.name,
    this.hig = 50.01,
    this.wid = double.infinity,
    required this.onPresd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wid,
      height: hig,
      child: ElevatedButton(
        onPressed: onPresd,
        child: Text(
          name.toString(),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XfffCF1349),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
