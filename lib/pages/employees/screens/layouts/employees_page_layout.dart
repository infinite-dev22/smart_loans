import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/employees/employees_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/error/employees_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/initial/employee_details_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/loading/employees_loading_widget.dart';
import 'package:smart_loans/pages/employees/widgets/success/employees_success_widget.dart';

class EmployeesPageLayout extends StatelessWidget {
  const EmployeesPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesBloc, EmployeesState>(
      builder: (context, state) {
        if (state.status == EmployeesStatus.initial) {
          context.read<EmployeesBloc>().add(GetEmployees());
        } else if (state.status == EmployeesStatus.success) {
          return const SingleChildScrollView(
            child: EmployeesSuccessWidget(),
          );
        } else if (state.status == EmployeesStatus.loading) {
          return const EmployeesLoadingWidget();
        } else if (state.status == EmployeesStatus.error) {
          return const EmployeesErrorWidget();
        } else if (state.status == EmployeesStatus.noData) {
          return const EmployeesInitialWidget();
        }
        return const EmployeesInitialWidget();
      },
    );
  }
}
