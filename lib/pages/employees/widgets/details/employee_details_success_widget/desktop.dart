import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/employees/widgets/error/employees_error_widget.dart';
import 'package:smart_loans/pages/employees/widgets/loading/employees_loading_widget.dart';
import 'package:smart_loans/pages/employees/widgets/success/forms/employee_form.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_officer_widget.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/title_with_actions.dart';

import '../../../../nations/bloc/nation_bloc.dart';
import '../../../bloc/employee/employee_bloc.dart';
import '../../../bloc/employees/employees_bloc.dart';
import '../../../bloc/forms/employees/employee_add_form_bloc.dart';
import '../../initial/employee_details_error_widget.dart';

class EmployeeDetailSuccessDesktop extends StatelessWidget {
  const EmployeeDetailSuccessDesktop({
    super.key,
    required this.employeeId,
  });

  final int employeeId;

  @override
  Widget build(BuildContext context) {
    var employee;
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state.status == EmployeeStatus.initial) {
          context.read<EmployeeBloc>().add(GetEmployee(employeeId));
        } else if (state.status == EmployeeStatus.success) {
          employee = context.read<EmployeeBloc>().state.employee;
          return SingleChildScrollView(child: _buildBody(context, employee));
        } else if (state.status == EmployeeStatus.loading) {
          return const EmployeesLoadingWidget();
        } else if (state.status == EmployeeStatus.error) {
          return const EmployeesErrorWidget();
        }
        return const EmployeesInitialWidget();
      },
    );
  }

  Widget _buildBody(BuildContext context, EmployeeModel employee) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(circularRadius),
                          topRight: Radius.circular(circularRadius),
                        ),
                      ),
                      child: TitleBarWithActions(
                        title: "Employee",
                        actions: [
                          IconButton(
                              tooltip: "Edit employee",
                              onPressed: () => _buildAddForm(context),
                              icon: const Icon(
                                Icons.edit_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              tooltip: "Process employee",
                              icon: const Icon(
                                Icons.recycling_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                            onPressed: () => _buildAddForm(context),
                            tooltip: "Add employee",
                            icon: const Icon(
                              Icons.add,
                              color: AppColor.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ProfilePhoto(
                                    totalWidth: 10.h,
                                    color: AppColor.white45,
                                    name: employee.middleName!,
                                    outlineColor:
                                    colors[Random().nextInt(colors.length)],
                                  ),
                                  if (kDebugMode)
                                    Positioned(
                                        right: -5,
                                        top: -5,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit_rounded,
                                            color: AppColor.white,
                                          ),
                                        ))
                                ],
                              ),
                              SizedBox(width: 1.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(employee.firstName!),
                                  Text(employee.lastName!),
                                ],
                              ),
                            ],
                          ),
                          FilledButton(
                            onPressed: () {},
                            child: const Text("Add Image"),
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 5,
                      child: _buildTabs(employee),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 1.w),
            const RightSideWidget(),
          ],
        ),
      ],
    );
  }

  Widget _buildTabs(employee) {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(
              child: Text("More Details"),
            ),

            Tab(
              child: Text("Loans"),
            ),
            Tab(
              child: Text("Next of Kin"),
            ),
            Tab(
              child: Text("Guarantor"),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: padding),
          child: SizedBox(
            height: 72.h,
            child: TabBarView(
              children: [
                _buildEmployeeMoreDetails(employee),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeeMoreDetails( EmployeeModel employee) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name: "),
                  Text("Last Name: "),
                  Text("Other Name: "),
                  Text("City: "),
                  Text("Address: "),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  employee.firstName ?? '',
                    style: TextStyle(
                      color: AppColor.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                employee.lastName ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    employee.middleName ?? '',

                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),


                  Text(
                    employee.permanentAddress ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    employee.permanentAddress ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text("Add Details"),
              ),
            ],
          ),
        ],
      ),
    );
  }



  _buildAddForm(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(
              providers: [
                BlocProvider<EmployeeBloc>(
                  create: (_) => EmployeeBloc(),
                ),
                BlocProvider<EmployeesBloc>(
                  create: (_) => EmployeesBloc(),
                ),
                BlocProvider<EmployeeAddFormBloc>(
                  create: (_) => EmployeeAddFormBloc(),
                ),
                BlocProvider<NationBloc>(
                  create: (_) => NationBloc(),
                ),

              ],
              child: EmployeeForm(
                parentContext: parentContext,
              )),
        );
      },
    );
  }
}

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: LoanOfficerWidget(width: 16.w),
    );
  }
}
