import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanSchedulesErrorWidget extends StatelessWidget {
  const LoanSchedulesErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading loan schedules",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
