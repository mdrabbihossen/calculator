import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String calBtnText;

  const CalculatorButton({
    Key? key,
    required this.calBtnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: calBtnText == "AC"
              ? AppColors.operatorColor
              : calBtnText == "<-"
                  ? AppColors.operatorColor
                  : calBtnText == "+/-"
                      ? AppColors.operatorColor
                      : calBtnText == "="
                          ? AppColors.orangeColor
                          : calBtnText == "/"
                              ? AppColors.operatorColor
                              : calBtnText == "x"
                                  ? AppColors.operatorColor
                                  : calBtnText == "-"
                                      ? AppColors.operatorColor
                                      : calBtnText == "+"
                                          ? AppColors.operatorColor
                                          : AppColors.buttonColor,
        ),
        child: Text(
          calBtnText,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
            color: calBtnText == "AC"
                ? AppColors.orangeColor
                : calBtnText == "<-"
                    ? AppColors.orangeColor
                    : Colors.white,
          ),
        ),
      ),
    );
  }
}
