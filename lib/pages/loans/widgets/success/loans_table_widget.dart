import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dynamic_table/dynamic_input_type/dynamic_table_input_type.dart';
import 'package:dynamic_table/dynamic_table_data_cell.dart';
import 'package:dynamic_table/dynamic_table_data_column.dart';
import 'package:dynamic_table/dynamic_table_data_row.dart';
import 'package:dynamic_table/dynamic_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/light.dart';

import '../../../../data_source/dummy_loans_data.dart';

class LoansTableWidget extends StatefulWidget {
  const LoansTableWidget({super.key});

  @override
  State<LoansTableWidget> createState() => _LoansTableWidgetState();
}

class _LoansTableWidgetState extends State<LoansTableWidget> {
  var tableKey = GlobalKey<DynamicTableState>();
  var myData = dummyLoansData.toList();

  Widget _buildLayoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) => SizedBox(
        width: constraint.maxWidth,
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: DynamicTable(
            key: tableKey,
            header: Text(
              "Loans",
              style: TextStyle(
                  color: LightAppColor.textColor, fontSize: headerFontSize),
            ),
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
            rowsPerPage: 15,
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
        width: 40.w,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search loans",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      SizedBox(width: 1.w),
      if (!Responsive.isMobile(context) && !Responsive.isTablet(context))
        _buildButton("Copy", () {}),
      _buildButton("Export", () {}),
      if (!Responsive.isMobile(context)) _buildButton("Filter", () {}),
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
            "Loan No.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onSort: (columnIndex, ascending) {},
          dynamicTableInputType: DynamicTableInputType.text()),
      DynamicTableDataColumn(
          label: const Text(
            "Loan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onSort: (columnIndex, ascending) {},
          isEditable: false,
          dynamicTableInputType: DynamicTableInputType.text()),
      DynamicTableDataColumn(
          label: const Text(
            "Principal Amount",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onSort: (columnIndex, ascending) {},
          isEditable: false,
          dynamicTableInputType: DynamicTableInputType.text()),
      DynamicTableDataColumn(
          label: const Text(
            "Loan Fees",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onSort: (columnIndex, ascending) {},
          isEditable: false,
          dynamicTableInputType: DynamicTableInputType.text()),
      DynamicTableDataColumn(
          label: const Text(
            "Loan Fees Type",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onSort: (columnIndex, ascending) {},
          isEditable: false,
          dynamicTableInputType: DynamicTableInputType.text()),
      DynamicTableDataColumn(
        label: const Text(
          "Currency",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.text(
          decoration: const InputDecoration(
            hintText: "Enter Other Info",
            border: OutlineInputBorder(),
          ),
          maxLines: 100,
        ),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Branch",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.text(
          decoration: const InputDecoration(
            hintText: "Enter Other Info",
            border: OutlineInputBorder(),
          ),
          maxLines: 100,
        ),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Loan Status",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.text(
          decoration: const InputDecoration(
            hintText: "Enter Other Info",
            border: OutlineInputBorder(),
          ),
          maxLines: 100,
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
          title: const Text('Add Loan'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 30.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Client")),
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
                          label: Text("Loan type")),
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
                          label: Text("Loan category")),
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
                          label: Text("Branch")),
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Description"),
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
                          label: Text("Currency")),
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Principal Amount"),
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
                          label: Text("Loan Fees")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Fixed Rate"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Percentage"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 5.h,
                        width: 10.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text("Unknown Field 1"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 5.h,
                        width: 15.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text("Unknown Field 2"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
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

  @override
  Widget build(BuildContext context) {
    return _buildLayoutBuilder();
  }

  @override
  void initState() {
    super.initState();
  }
}
