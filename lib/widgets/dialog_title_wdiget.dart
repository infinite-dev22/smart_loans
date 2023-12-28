import 'package:flutter/material.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class DialogTitleWidget extends StatelessWidget {
  final String text;

  const DialogTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(circularRadius),
          topRight: Radius.circular(circularRadius),
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColor.white),
          ),
        ],
      ),
    );
  }
}
