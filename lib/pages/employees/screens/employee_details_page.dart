import 'package:flutter/material.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget/desktop.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget/tablet.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/employee",
      body: SingleChildScrollView(
        child: Responsive(
          mobile: EmployeeDetailsSuccessMobile(),
          tablet: EmployeeDetailsSuccessTablet(),
          desktop: EmployeeDetailsSuccessDesktop(),
        ),
      ),
    );
  }
}
