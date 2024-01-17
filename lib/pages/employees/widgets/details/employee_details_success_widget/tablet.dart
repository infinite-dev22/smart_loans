import 'dart:math';

import 'package:dynamic_table/dynamic_input_type/dynamic_table_input_type.dart';
import 'package:dynamic_table/dynamic_table_data_cell.dart';
import 'package:dynamic_table/dynamic_table_data_column.dart';
import 'package:dynamic_table/dynamic_table_data_row.dart';
import 'package:dynamic_table/dynamic_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc/client_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/bloc/forms/clients/employee_add_form_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/success/forms/employee_form.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_officer_widget.dart';
import 'package:smart_loans/pages/nations/bloc/nation_bloc.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/title_with_actions.dart';

import '../../../../../data_source/dummy_employee_data.dart';
import '../../../../../widgets/subtitle_widget.dart';
import '../../../../../widgets/title_widget.dart';

class EmployeeDetailsSuccessTablet extends StatefulWidget {
  const EmployeeDetailsSuccessTablet({super.key});

  @override
  State<EmployeeDetailsSuccessTablet> createState() =>
      _EmployeeDetailsSuccessTabletState();
}

class _EmployeeDetailsSuccessTabletState
    extends State<EmployeeDetailsSuccessTablet> {
  var tableKey = GlobalKey<DynamicTableState>();
  var myData = dummyEmployeeData.toList();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
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
                              tooltip: "Edit employee details",
                              onPressed: () => _buildAddForm(context),
                              icon: const Icon(
                                Icons.edit_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              tooltip: "Process employee details",
                              icon: const Icon(
                                Icons.recycling_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                            onPressed: () => _buildAddForm(context),
                            tooltip: "Add Employee details",
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
                              ProfilePhoto(
                                totalWidth: 10.h,
                                color: AppColor.white45,
                              ),
                              SizedBox(width: 1.w),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(text: "Vicent Company"),
                                  SubTitleWidget(text: "Individual"),
                                  Text("I-231204-0001"),
                                  Text("12295200000"),
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
                      child: _buildTabs(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const RightSideWidget(),
      ],
    );
  }

  Widget _buildTabs() {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(
              child: Text("More Details"),
            ),
            Tab(
              child: Text("Documents"),
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
                _buildEmployeeMoreDetails(),
                _buildEmployeeLoanDocumentDetails(),
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

  Widget _buildEmployeeMoreDetails() {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name: "),
                  Text("Last Name: "),
                  Text("Other Name: "),
                  Text("Nationality: "),
                  Text("Business Type: "),
                  Text("City: "),
                  Text("Address: "),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0000001",
                    style: TextStyle(
                      color: AppColor.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Vicent Company",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "12295200000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Kampala",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "APPROVED (4.12.2023)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "LV2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Address",
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

  Widget _buildEmployeeLoanDocumentDetails() {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: DynamicTable(
            header: Container(),
            key: tableKey,
            onRowEdit: (index, row) {
              myData[index] = row;
              return true;
            },
            onRowDelete: (index, row) {
              myData.removeAt(index);
              return true;
            },
            onRowSave: (index, old, newValue) {
              if (newValue[0] == null) {
                return null;
              }

              if (newValue[0].toString().length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name must be atleast 3 characters long"),
                  ),
                );
                return null;
              }
              if (newValue[0].toString().length > 20) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name must be less than 20 characters long"),
                  ),
                );
                return null;
              }
              if (newValue[1] == null) {
                //If newly added row then add unique ID
                newValue[1] = Random()
                    .nextInt(500)
                    .toString(); // to add Unique ID because it is not editable
              }
              myData[index] = newValue; // Update data
              if (newValue[0] == null) {
                return null;
              }
              return newValue;
            },
            showActions: true,
            showAddRowButton: false,
            showDeleteAction: true,
            rowsPerPage: 5,
            showFirstLastButtons: true,
            availableRowsPerPage: const [
              5,
              10,
              15,
              20,
              25,
              50,
              75,
              100,
            ],
            dataRowMinHeight: 4.5.h,
            dataRowMaxHeight: 4.5.h,
            columnSpacing: 60,
            actionColumnTitle: "Actions",
            showCheckboxColumn: true,
            onSelectAll: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: value ?? false
                      ? const Text("All Rows Selected")
                      : const Text("All Rows Unselected"),
                ),
              );
            },
            onRowsPerPageChanged: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Rows Per Page Changed to $value"),
                ),
              );
            },
            actions: _buildActions(),
            rows: _buildRows(),
            columns: _buildColumns(),
          ),
        );
      }),
    );
  }

  List<Widget> _buildActions() {
    return [
      SizedBox(
        width: 20.w,
        height: textFieldHeight,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search documents",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      SizedBox(width: 10.w),
      // Show only when an item(s) (has/have) been selected.
      _buildButton("Delete", () {}),
      _buildButton("Add", _buildAddDocumentDialog),
    ];
  }

  List<DynamicTableDataRow> _buildRows() {
    return List.generate(
      myData.length,
      (index) => DynamicTableDataRow(
        onSelectChanged: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: value ?? false
                  ? Text("Row Selected index:$index")
                  : Text("Row Unselected index:$index"),
            ),
          );
        },
        index: index,
        cells: List.generate(
          myData[index].length,
          (cellIndex) => DynamicTableDataCell(
            value: myData[index][cellIndex],
          ),
        ),
      ),
    );
  }

  List<DynamicTableDataColumn> _buildColumns() {
    return [
      DynamicTableDataColumn(
        label: const Text(
          "Date Uploaded",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        isEditable: false,
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "File Extension",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Document Type",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "File Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.date(
          context: context,
          decoration: const InputDecoration(
              hintText: "Date added",
              suffixIcon: Icon(Icons.date_range),
              border: OutlineInputBorder()),
          initialDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
        ),
      ),
    ];
  }

  Widget _buildButton(
    String title,
    Function()? onPressed,
  ) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }

  _buildAddDocumentDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider<ClientBloc>(
              create: (_) => ClientBloc(),
            ),
            BlocProvider<NationBloc>(
              create: (_) => NationBloc(),
            ),
            BlocProvider<EmployeeBloc>(
              create: (_) => EmployeeBloc(),
            ),
            BlocProvider<EmployeeAddFormBloc>(
              create: (_) => EmployeeAddFormBloc(),
            ),
          ], child: const EmployeeForm()),
        );
      },
    );
  }

  _buildAddForm(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider<ClientBloc>(
              create: (_) => ClientBloc(),
            ),
            BlocProvider<NationBloc>(
              create: (_) => NationBloc(),
            ),
            BlocProvider<EmployeeBloc>(
              create: (_) => EmployeeBloc(),
            ),
            BlocProvider<EmployeeAddFormBloc>(
              create: (_) => EmployeeAddFormBloc(),
            ),
          ], child: const EmployeeForm()),
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
    return const LoanOfficerWidget();
  }
}
