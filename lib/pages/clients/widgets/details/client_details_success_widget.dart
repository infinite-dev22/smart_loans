import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dynamic_table/dynamic_input_type/dynamic_table_input_type.dart';
import 'package:dynamic_table/dynamic_table_data_cell.dart';
import 'package:dynamic_table/dynamic_table_data_column.dart';
import 'package:dynamic_table/dynamic_table_data_row.dart';
import 'package:dynamic_table/dynamic_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/data_source/dummy_employee_data.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class ClientDetailSuccessWidget extends StatefulWidget {
  const ClientDetailSuccessWidget({super.key});

  @override
  State<ClientDetailSuccessWidget> createState() =>
      _ClientDetailSuccessWidgetState();
}

class _ClientDetailSuccessWidgetState extends State<ClientDetailSuccessWidget> {
  var tableKey = GlobalKey<DynamicTableState>();
  var myData = dummyEmployeeData.toList();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: SizedBox(
            width: 60.w,
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
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Text(
                          "Client Details",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.white,
                          ),
                        ),
                      ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle(
                                "Vicent Company",
                              ),
                              _buildSubTitle("Individual"),
                              const Text("I-231204-0001"),
                              const Text("12295200000"),
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
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Edit Client"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("List"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Convert"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Add Client"),
                  ),
                  SizedBox(width: 1.w),
                ],
              ),
            ),
            Card(
              child: SizedBox(
                width: 25.w,
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
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: const Text(
                              "Loans Officer",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfilePhoto(
                            totalWidth: 5.h,
                            color: AppColor.white45,
                          ),
                          const Text("Valeria Konarld"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle(String data) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubTitle(String data) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.italic,
      ),
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
            width: 55.w,
            height: 72.h,
            child: TabBarView(
              children: [
                _buildClientMoreDetails(),
                _buildClientLoanDocumentDetails(),
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

  Widget _buildClientMoreDetails() {
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

  Widget _buildClientLoanDocumentDetails() {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: DynamicTable(
            header: Container(),
            key: tableKey,
            onRowEdit: (index, row) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Row Edited index:$index row:$row"),
                ),
              );
              myData[index] = row;
              return true;
            },
            onRowDelete: (index, row) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Row Deleted index:$index row:$row"),
                ),
              );
              myData.removeAt(index);
              return true;
            },
            onRowSave: (index, old, newValue) {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content:
              //         Text("Row Saved index:$index old:$old new:$newValue"),
              //   ),
              // );
              if (newValue[0] == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name cannot be null"),
                  ),
                );
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name cannot be null"),
                  ),
                );
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
      _buildButton("Add", () async {
        _buildAddForm();
      }),
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

  _buildAddForm() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Employee'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 30.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("First Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Other Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Designations")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Test 1"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Test 2"),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text("Test 3"),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text("Test 4"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
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
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Telephone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FilledButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(double.infinity, 50),
                ),
              ),
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
