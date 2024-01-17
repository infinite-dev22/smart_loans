import 'package:flutter/material.dart';
import 'package:smart_loans/pages/employees/screens/layouts/employees_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/employees",
      body: EmployeesPageLayout(),
    );
  }
}
