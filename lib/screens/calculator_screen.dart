import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/calculator_button.dart';
import '../utils/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  final List<String> history;

  const CalculatorScreen({super.key, required this.history});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String output = "";
  bool isResultShown = false;

  void onButtonClick(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "";
        isResultShown = false;
      } else if (value == "⌫") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        try {
          String expression = input
              .replaceAll('×', '*')
              .replaceAll('÷', '/')
              .replaceAllMapped(RegExp(r'(\d+(\.\d+)?)%'), (match) {
                double value = double.parse(match.group(1)!);
                return '(${value}/100)';
              });

          output = CalculatorLogic.calculate(expression);
          widget.history.add("$input = $output");
          input = "";
          isResultShown = true;
        } catch (e) {
          output = "Error";
        }
      } else {
        if (isResultShown) {
          if (RegExp(r'[\+\-×÷%]').hasMatch(value)) {
            input = output + value;
          } else {
            input = value;
          }
          output = "";
          isResultShown = false;
        } else {
          if ((input.isEmpty && value == "%") || (input.endsWith("%") && value == "%")) return;
          if (value == "%" && (input.isEmpty || !RegExp(r'\d$').hasMatch(input))) return;
          if (input.isNotEmpty && RegExp(r'[\+\-×÷]$').hasMatch(input) && RegExp(r'[\+\-×÷%]').hasMatch(value)) return;

          input += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text(
          " My Kalkulator  💖",
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[400],
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.pink.shade200, blurRadius: 15, spreadRadius: 3),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(minHeight: 100),
                child: Text(
                  input.isNotEmpty ? input : output,
                  style: GoogleFonts.nunito(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.pink[700]),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Divider(color: Colors.pink),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 1.3,
                children: [
                  "(", ")", "AC", "⌫",
                  "7", "8", "9", "÷",
                  "4", "5", "6", "×",
                  "1", "2", "3", "-",
                  "0", ".", "%", "+",
                  "="
                ].map((e) => CalculatorButton(e, onButtonClick, isCute: true)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
