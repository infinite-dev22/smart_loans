import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/forms/clients/employee_add_form_bloc.dart';
import 'package:smart_loans/pages/nations/bloc/nation_bloc.dart';
import 'package:smart_loans/theme/light.dart';
import 'package:smart_loans/widgets/custom_accordion.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if (state.status == EmployeeStatus.success) {
          BlocProvider.of<EmployeeBloc>(context).add(GetEmployees());
          Navigator.of(context).pop();
        }
      },
      child: _buildSuccessBody(context),
    );
  }

  Widget _buildSuccessBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 30.w : 40.w,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              const DialogTitleWidget(text: 'Employee Form'),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: constraints.maxWidth,
                      // Make it like Twitter's BootStrap
                      child: Wrap(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .31,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text("First Name"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) => employee.firstName = value,
                            ),
                          ),
                          SizedBox(width: 1.h),
                          SizedBox(
                            width: constraints.maxWidth * .31,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text("Last Name"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) => employee.lastName = value,
                            ),
                          ),
                          SizedBox(width: 1.h),
                          SizedBox(
                            width: constraints.maxWidth * .31,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text("Other Name"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) => employee.middleName = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 50,
                      child: DropdownButtonFormField2(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            label: Text("Gender")),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Female"),
                          ),
                        ],
                        onChanged: (value) => employee.gender = value,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    DateAccordion(dateController: dateController),
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: constraints.maxWidth,
                      child: Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .475,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text("Telephone"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) => employee.telephone = value,
                            ),
                          ),
                          SizedBox(width: 1.h),
                          SizedBox(
                            width: constraints.maxWidth * .475,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text("Email"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) =>
                                  employee.personalEmail = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    BlocBuilder<EmployeeAddFormBloc, EmployeeAddFormState>(
                      builder: (context, state) {
                        if (state.status == EmployeeAddFormStatus.initial) {
                          context.read<EmployeeAddFormBloc>().add(GetRoles());
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const CupertinoActivityIndicator(),
                          );
                        }
                        if (state.status == EmployeeAddFormStatus.success) {
                          return SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  label: Text("Department")),
                              items: context
                                  .read<EmployeeAddFormBloc>()
                                  .state
                                  .roles
                                  ?.map((role) => DropdownMenuItem(
                                        value: role.id,
                                        child: Text(role.name),
                                      ))
                                  .toList(),
                              onChanged: (value) =>
                                  employee.departmentId = value,
                            ),
                          );
                        }
                        if (state.status == EmployeeAddFormStatus.error) {
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const Center(
                              child: Icon(Icons.error_outline_rounded),
                            ),
                          );
                        }
                        return Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            border: Border.all(
                                width: 1, color: LightAppColor.darker),
                          ),
                          child: const CupertinoActivityIndicator(),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    BlocBuilder<NationBloc, NationState>(
                      builder: (context, state) {
                        if (state.status == NationStatus.initial) {
                          context.read<NationBloc>().add(GetNations());
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const CupertinoActivityIndicator(),
                          );
                        }
                        if (state.status == NationStatus.success) {
                          return SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  label: Text(
                                    "Nationality",
                                  )),
                              items: context
                                  .read<NationBloc>()
                                  .state
                                  .nations
                                  ?.map((clientType) => DropdownMenuItem(
                                        value: clientType.id,
                                        child: Text(clientType.name!),
                                      ))
                                  .toList(),
                              onChanged: (value) => employee.nationId = value,
                            ),
                          );
                        }
                        if (state.status == NationStatus.error) {
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const Center(
                              child: Icon(Icons.error_outline_rounded),
                            ),
                          );
                        }
                        return Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            border: Border.all(
                                width: 1, color: LightAppColor.darker),
                          ),
                          child: const CupertinoActivityIndicator(),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: const Text("Address"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (value) => employee.permanentAddress = value,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    FilledButton(
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        employee.dateOfBirth =
                            DateTime.tryParse(dateController.text.trim());
                        print(jsonEncode(employee.toApiJson()));
                        context
                            .read<EmployeeBloc>()
                            .add(CreateEmployee(employee));
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
