import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';

class SubTitleWidget extends StatelessWidget {
  final String text;

  const SubTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: (Responsive.isDesktop(context))
            ? 12.sp
            : (Responsive.isTablet(context))
                ? 14.sp
                : (Responsive.isMobile(context))
                    ? 16.sp
                    : 18.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
