import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class EmployeesErrorWidget extends StatelessWidget {
  const EmployeesErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading employees",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
