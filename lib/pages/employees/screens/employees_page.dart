import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/screens/layouts/employees_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      route: "employees",
      body: BlocProvider(
        create: (context) => EmployeeBloc(),
        child: const EmployeesPageLayout(),
      ),
    );
  }
}
