import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  static String calculate(String input) {
    try {
      input = input.replaceAll('×', '*').replaceAll('÷', '/');

      // **Debug: Cek input awal**
      print("Input awal: \$input");

      // **Konversi % menjadi (/100) hanya untuk angka yang memiliki %**
      input = input.replaceAllMapped(RegExp(r'(?<=\d)%'), (match) {
        return '*0.01';
      });

      // **Debug: Cek input setelah konversi persen**
      print("Setelah konversi persen: \$input");

      // **Mencegah operator berturut-turut yang tidak valid**
      if (RegExp(r'[+\-*/]{2,}').hasMatch(input)) {
        print("Error: Operator berturut-turut tidak valid");
        return "Error";
      }

      // **Pastikan ekspresi valid sebelum diparsing**
      if (RegExp(r'[^\d+\-*/(). ]').hasMatch(input)) {
        print("Error: Karakter tidak valid dalam ekspresi");
        return "Error";
      }

      // **Parsing ekspresi matematika**
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // **Bulatkan hasil agar lebih rapi tanpa trailing zero**
      String result = eval.toStringAsFixed(6).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
      
      // **Debug: Cek hasil akhir**
      print("Hasil akhir: \$result");
      
      return result;
    } catch (e) {
      print("Error saat menghitung: \$e");
      return "Error";
    }
  }
}