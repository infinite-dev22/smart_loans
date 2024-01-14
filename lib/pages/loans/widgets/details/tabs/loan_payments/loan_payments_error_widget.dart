import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanPaymentsErrorWidget extends StatelessWidget {
  const LoanPaymentsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading loan payments",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
