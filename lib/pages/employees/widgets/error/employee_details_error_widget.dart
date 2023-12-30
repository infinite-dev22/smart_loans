import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class EmployeeDetailsLoadingWidget extends StatelessWidget {
  const EmployeeDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading employee details",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
