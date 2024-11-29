// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/resultSceren.dart';
import 'package:flutter_application_4/wigdht/bouttons21.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _nameState();
}

class _nameState extends State<Homescreen> {
  int age = 30;
  int weight1 = 80;
  int hig = 174;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1B1A2C),
      appBar: AppBar(
        backgroundColor: const Color(0xfff1B1A2C),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: (isMale)
                                ? Color(0XfffCF1448)
                                : Color(0Xfff141427),
                            borderRadius: BorderRadius.circular(20)),
                        child: continer(i: Icons.male, f: 'Male'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            (!isMale) ? Color(0XfffCF1448) : Color(0Xfff141427),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: continer(i: Icons.female, f: 'Female')),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0Xfff191827),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          hig.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Slider(
                      value: hig.toDouble(),
                      max: 200,
                      min: 120,
                      activeColor: Color(0XFFFCF1448),
                      inactiveColor: Color(0XFFF141427),
                      onChanged: (value) {
                        setState(() {
                          hig = value.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFFF141427),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: continerDown(
                        label: 'Age',
                        value: age,
                        onDecrement: () {
                          setState(() {
                            if (age > 0) age--;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0XFFF141427),
                          borderRadius: BorderRadius.circular(20)),
                      child: continerDown(
                        label: 'Weight',
                        value: weight1,
                        onDecrement: () {
                          setState(() {
                            if (weight1 > 0) weight1--;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            weight1++;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Bouttons21(
              name: 'Calculate',
              hig: 50,
              wid: double.infinity,
              onPresd: () {
                double higM = hig / 100;
                double result1 = weight1 / (higM * higM);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return result(Re:result1);
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class continer extends StatelessWidget {
  final IconData? i;
  final String? f;
  const continer({
    super.key,
    required this.i,
    required this.f,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(i, size: 100, color: Colors.white),
        Text(
          f.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class continerDown extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const continerDown({
    super.key,
    required this.label,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: onDecrement,
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: const Color(0Xfff27282D)),
            ),
            IconButton.filled(
              onPressed: onIncrement,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: const Color(0Xfff27282D)),
            )
          ],
        )
      ],
    );
  }
}
