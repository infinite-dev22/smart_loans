import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/employees/bloc/employees/employees_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget/desktop.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_details_success_widget/tablet.dart';
import 'package:smart_loans/pages/employees/widgets/error/employees_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/initial/employee_details_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/loading/employees_loading_widget.dart';
class EmployeeDetailPageLayout extends StatelessWidget {
  const EmployeeDetailPageLayout({ super.key, required this.employeeId});
  final int employeeId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesBloc, EmployeesState>(
      builder: (context, state) {
        if (state.status == EmployeesStatus.initial) {
          context.read<EmployeesBloc>().add(GetEmployees());
        } else if (state.status == EmployeesStatus.success) {
          return Responsive(
              mobile: EmployeeDetailsSuccessMobile(employeeId: employeeId),
              tablet: EmployeeDetailsSuccessTablet(employeeId: employeeId),
              desktop: EmployeeDetailSuccessDesktop(employeeId: employeeId)
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
