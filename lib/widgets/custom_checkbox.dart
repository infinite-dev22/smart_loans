import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final EdgeInsets padding;
  final bool? value;
  final Function(bool?)? onChanged;
  final Function()? onTap;
  final String text;
  final TextStyle? textStyle;

  const CheckBox({
    super.key,
    required this.padding,
    required this.value,
    this.onChanged,
    this.onTap,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          const SizedBox(width: 5),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
