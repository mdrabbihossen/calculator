import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/views/home/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: calculatorModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return CalculatorButton(
                  calBtnText: calculatorModel[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
