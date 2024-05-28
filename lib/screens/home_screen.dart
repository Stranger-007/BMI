import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final wtController = TextEditingController();
  final ftController = TextEditingController();
  final inController = TextEditingController();

  var result = '';
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: bgColor,
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Card(
                      elevation: 3,
                      child: TextField(
                        controller: wtController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Weight (in Kgs)',
                          prefixIcon: Icon(Icons.line_weight),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Card(
                      elevation: 3,
                      child: TextField(
                        controller: ftController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Height (in Cm)',
                          prefixIcon: Icon(Icons.height_sharp),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Card(
                      elevation: 3,
                      child: TextField(
                        controller: inController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Height (in Inches)',
                          prefixIcon: Icon(Icons.height_sharp),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CupertinoColors.activeBlue,
                        foregroundColor: CupertinoColors.white,
                      ),
                      onPressed: () {
                        var wt = wtController.text;
                        var ft = ftController.text;
                        var inch = inController.text;

                        if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                          try {
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tInch = (ift * 12) + iInch;
                            var tCm = tInch * 2.54;
                            var tH = tCm / 100;
                            var bmi = iwt / (tH * tH);

                            var msg = '';
                            if (bmi > 25) {
                              msg = "You're OverWeight!!!";
                              bgColor = Colors.orange.shade300;
                            } else if (bmi < 18) {
                              msg = "You're UnderWeight!!!";
                              bgColor = Colors.orange.shade300;
                            } else {
                              msg = "You're Healthy!!!";
                              bgColor = Colors.orange.shade300;
                            }

                            // Update the result state with both message and BMI
                            setState(() {
                              result =
                                  '$msg\nYour BMI is ${bmi.toStringAsFixed(2)}';
                            });
                          } catch (e) {
                            setState(() {
                              result =
                                  'Invalid input. Please enter numbers only.';
                            });
                          }
                        } else {
                          setState(() {
                            result = 'Please Enter The Required Field';
                          });
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Calculate BMI',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      result,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
