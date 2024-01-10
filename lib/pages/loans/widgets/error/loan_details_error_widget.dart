import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanDetailsErrorWidget extends StatelessWidget {
  const LoanDetailsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading loan details",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
