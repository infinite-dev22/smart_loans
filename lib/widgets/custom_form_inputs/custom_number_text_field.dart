import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration? decoration;
  final bool readOnly;
  final int? maxLength;
  final Function(String)? onChanged;

  const CustomNumberTextField({
    super.key,
    required this.controller,
    this.decoration,
    this.readOnly = false,
    this.maxLength,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    FilteringTextInputFormatter formatNumerals =
        FilteringTextInputFormatter(RegExp(r'[^0-9]'), allow: false);
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: decoration,
      keyboardType: const TextInputType.numberWithOptions(),
      onChanged: onChanged,
      inputFormatters: [
        formatNumerals,
        LengthLimitingTextInputFormatter(maxLength),
      ],
    );
  }
}
