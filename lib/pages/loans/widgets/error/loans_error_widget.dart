import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class LoansErrorWidget extends StatelessWidget {
  const LoansErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading loans",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
