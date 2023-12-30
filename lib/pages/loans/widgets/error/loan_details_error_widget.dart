import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanDetailsLoadingWidget extends StatelessWidget {
  const LoanDetailsLoadingWidget({super.key});

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
