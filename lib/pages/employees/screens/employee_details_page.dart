import 'package:flutter/material.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/client",
      body: EmployeeDetailsSuccessWidget(),
    );
  }
}
