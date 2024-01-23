import 'package:flutter/material.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/employees/screens/layouts/employee_detail_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int? employeeId;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      employeeId = ModalRoute.of(context)!.settings.arguments as int;
      getLocalStorage().write("employee_id", employeeId);
    } else {
      employeeId = getLocalStorage().read("employee_id");
    }
    return CustomScaffold(
      route: "/employee",
      body: EmployeeDetailPageLayout(employeeId: employeeId!),
    );
  }
}
