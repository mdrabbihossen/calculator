import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/views/home/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "";
  String operand = "";
  bool hideInput = false;
  double resultFontSize = 34.0;

  void onButtonClick(value) {
    setState(() {
      if (value == "AC") {
        input = "";
        result = "";
      } else if (value == "<") {
        input.isNotEmpty
            ? input = input.substring(0, input.length - 1)
            : input = "";
      } else if (value == "=") {
        if (input.isNotEmpty) {
          String userInput = input;
          userInput = input.replaceAll("x", "*");
          Parser parser = Parser();
          Expression expression = parser.parse(userInput);
          ContextModel contextModel = ContextModel();
          result = "${expression.evaluate(EvaluationType.REAL, contextModel)}";
          if (result.endsWith(".0")) {
            result = result.substring(0, result.length - 2);
          }
          input = result;
          hideInput = true;
          resultFontSize = 52.0;
        }
      } else {
        input = input + value;
        hideInput = false;
        resultFontSize = 35.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? "" : input,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    result,
                    style: GoogleFonts.montserrat(
                      color: Colors.white.withOpacity(.7),
                      fontSize: resultFontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: calculatorModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return CalculatorButton(
                  calBtnText: calculatorModel[index],
                  onButtonClick: () => onButtonClick(calculatorModel[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
