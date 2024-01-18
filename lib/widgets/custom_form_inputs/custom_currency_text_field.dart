import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_loans/utils/custom_number_formatter.dart';

class CustomCurrencyTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration? decoration;
  final bool readOnly;

  const CustomCurrencyTextField({
    super.key,
    required this.controller,
    this.decoration,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    FilteringTextInputFormatter formatNumerals =
        FilteringTextInputFormatter(RegExp(r'[\d.]'), allow: true);
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: decoration,
      onTap: () {
        controller.selection =
            TextSelection(baseOffset: 0, extentOffset: controller.text.length);
      },
      keyboardType: const TextInputType.numberWithOptions(),
      inputFormatters: [
        formatNumerals,
        CustomNumberInputFormatter(),
        LengthLimitingTextInputFormatter(16),
      ],
    );
  }
}
