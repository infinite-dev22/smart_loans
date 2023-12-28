import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: (Responsive.isDesktop(context))
            ? 14.sp
            : (Responsive.isTablet(context))
                ? 16.sp
                : (Responsive.isMobile(context))
                    ? 18.sp
                    : 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
