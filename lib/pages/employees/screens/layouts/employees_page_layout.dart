import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/error/employees_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/initial/employee_details_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/loading/employees_loading_widget.dart';
import 'package:smart_loans/pages/employees/widgets/success/employees_success_widget.dart';

class EmployeesPageLayout extends StatelessWidget {
  const EmployeesPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state.status == EmployeeStatus.initial) {
          context.read<EmployeeBloc>().add(GetEmployees());
        } else if (state.status == EmployeeStatus.success) {
          return const EmployeesSuccessWidget();
        } else if (state.status == EmployeeStatus.loading) {
          return const EmployeesLoadingWidget();
        } else if (state.status == EmployeeStatus.error) {
          return const EmployeesErrorWidget();
        } else if (state.status == EmployeeStatus.noData) {
          return const EmployeesInitialWidget();
        }
        return const EmployeesInitialWidget();
      },
    );
  }
}
