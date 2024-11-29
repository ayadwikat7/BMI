import 'package:flutter/material.dart';

class result extends StatelessWidget {
  String stst(){
    if (Re < 18.4) return 'UnderWeight';
    else if (Re >= 18.5 && Re <= 24.9) return 'Normal';
    else if (Re >= 25 && Re <= 29.9) return 'OverWeight';
    else return 'Obese';
  }
  Color ststColor(){
    if (Re < 18.4) return Color(0XfffF7DA85);
    else if (Re >= 18.5 && Re <= 24.9) return Color(0XFFF88CD7A);
    else if (Re >= 25 && Re <= 29.9) return Color(0XFFFFFB54C);
    else return Color(0XFFFFF6861);
  }
  final double Re;

  const result({super.key, required this.Re});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XfffCF1448),
      appBar: AppBar(
        backgroundColor: const Color(0XfffCF1448),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Result of BMI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 37,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            // BMI result display
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(stst(),
                      style: TextStyle(
                        color: ststColor(),
                        fontSize: 35,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          const Text(
                            'Result of BMI:',
                            style: TextStyle(
                              color: Color(0Xfff141427),
                              fontSize: 25,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            Re.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Color(0Xfff141427),
                              fontSize: 30,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // BMI state information
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    ColumnText(
                      title: 'BMI',
                      row1: '<18.4',
                      row2: '18.5-24.9',
                      row3: '25-29.9',
                      row4: '>30',
                      currentBMI: Re,
                    ),
                    const SizedBox(width: 20),
                    ColumnText(
                      title: 'State',
                      row1: 'Underweight',
                      row2: 'Normal',
                      row3: 'Overweight',
                      row4: 'Obese',
                      currentBMI: Re,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnText extends StatelessWidget {
  final String title;
  final String row1, row2, row3, row4;
  final double currentBMI;

  const ColumnText({
    super.key,
    required this.title,
    required this.row1,
    required this.row2,
    required this.row3,
    required this.row4,
    required this.currentBMI,
  });

  Color getRowColor(String row) {
    if (row.contains('<18.4') && currentBMI < 18.4) return const Color(0XFFFFFE189);
    if (row.contains('18.5-24.9') && currentBMI >= 18.5 && currentBMI <= 24.9) return const Color(0Xfff88CD7A);
    if (row.contains('25-29.9') && currentBMI >= 25 && currentBMI <= 29.9) return const Color(0XFFFFFB54C);
    if (row.contains('>30') && currentBMI > 30) return Colors.red;
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0Xfff141427),
                fontSize: 20,
                fontFamily: 'Times New Roman',
                fontWeight: FontWeight.bold,
              ),
            ),
           SizedBox(height: 20),
            buildRow(row1),
            const SizedBox(height: 20),
            buildRow(row2),
            const SizedBox(height: 20),
            buildRow(row3),
            const SizedBox(height: 20),
            buildRow(row4),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String rowText) {
    
    return Container(
      decoration: BoxDecoration(
        color: getRowColor(rowText),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(4),
      child: Text(
        rowText,
        style: const TextStyle(
          color: Color(0Xfff141427),
          fontSize: 20,
          fontFamily: 'Times New Roman',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
