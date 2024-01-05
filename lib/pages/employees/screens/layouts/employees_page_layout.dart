import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/error/employees_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/initial/employee_details_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/loading/employees_loading_widget.dart';
import 'package:smart_loans/pages/employees/widgets/success/employees_success_widget.dart';

class EmployeesPageLayout extends StatefulWidget {
  const EmployeesPageLayout({Key? key}) : super(key: key);

  @override
  State<EmployeesPageLayout> createState() => _EmployeesPageLayoutState();
}

class _EmployeesPageLayoutState extends State<EmployeesPageLayout> {
  final employeesBloc = EmployeeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      bloc: employeesBloc,
      builder: (context, state) {
        if (state is EmployeesInitial) {
          context.read<EmployeeBloc>().add(GetEmployees());
        } else if (state is EmployeesSuccess) {
          return const EmployeesSuccessWidget();
        } else if (state is EmployeesLoading) {
          return const EmployeesLoadingWidget();
        } else if (state is EmployeesError) {
          return const EmployeesErrorWidget();
        } else if (state is EmployeeNoData) {
          return const EmployeesInitialWidget();
        }
        return const EmployeesInitialWidget();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    employeesBloc.close();
  }
}
