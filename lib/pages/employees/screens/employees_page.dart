import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/error/employees_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/initial/employee_details_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/loading/employees_loading_widget.dart';
import 'package:smart_loans/pages/employees/widgets/success/employees_success_widget.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final employeesBloc = EmployeeBloc();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      route: "employees",
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        bloc: employeesBloc,
        // Use the instance you created instead of the class
        builder: (context, state) {
          if (state is EmployeesSuccess) {
            return  EmployeesSuccessWidget(blocProvider: employeesBloc);
          } else if (state is EmployeesLoading) {
            return const EmployeesLoadingWidget();
          } else if (state is EmployeesError) {
            return const EmployeesErrorWidget();
          } else if (state is EmployeeNoData) {
            return const EmployeesInitialWidget();
          } else {
            // For now let's just show the data screen as an initial screen.
            // return const EmployeesSuccessWidget();
            return  EmployeesSuccessWidget(blocProvider: employeesBloc);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    employeesBloc.close();
  }
}
