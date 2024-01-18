import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,###.##");
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

// class CustomNumberInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // Only allow numbers, a decimal point, and thousand separators.
//     String newText = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');
//     newText =
//         newText.replaceAll(RegExp(r'(\d{3})(?=(?:\d{3})+(?!\d))'), r'\1,');
//
//     // If the new text is empty, return an empty TextEditingValue.
//     if (newText.isEmpty) {
//       return TextEditingValue.empty;
//     }
//
//     // If the new text is a number, return a TextEditingValue with the new text.
//     if (isNumeric(newText)) {
//       return TextEditingValue(
//         text: newText,
//         selection:
//             TextSelection.fromPosition(TextPosition(offset: newText.length)),
//       );
//     }
//
//     // If the new text is not a number, return the old TextEditingValue.
//     return oldValue;
//   }
//
//   bool isNumeric(String? s) {
//     if (s == null) {
//       return false;
//     }
//     return double.tryParse(s) != null;
//   }
// }
