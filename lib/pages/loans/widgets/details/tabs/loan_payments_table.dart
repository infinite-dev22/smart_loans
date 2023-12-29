import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dynamic_table/dynamic_input_type/dynamic_table_input_type.dart';
import 'package:dynamic_table/dynamic_table_data_cell.dart';
import 'package:dynamic_table/dynamic_table_data_column.dart';
import 'package:dynamic_table/dynamic_table_data_row.dart';
import 'package:dynamic_table/dynamic_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/payment_form.dart';

import '../../../../../data_source/dummy_loan_payments_data.dart';
import '../../../../../data_source/dummy_loans_data.dart';
import '../../../../../global_values.dart';

class LoanPaymentsTable extends StatefulWidget {

  const LoanPaymentsTable({super.key});

  @override
  State<LoanPaymentsTable> createState() => _LoanPaymentsTableState();
}

class _LoanPaymentsTableState extends State<LoanPaymentsTable> {
  var tableKey = GlobalKey<DynamicTableState>();

  var myData = dummyLoanPaymentsData.toList();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          // width: MediaQuery.of(context).size.width * 0.16,
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
            actions: _buildActions(context),
            rows: _buildRows(context),
            columns: _buildColumns(context),
          ),
        );
      }),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      SizedBox(
        width: 20.w,
        height: textFieldHeight,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search payments",
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
        _buildAddForm(context);
      }),
    ];
  }

  List<DynamicTableDataRow> _buildRows(BuildContext context) {
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

  List<DynamicTableDataColumn> _buildColumns(BuildContext context) {
    return [
      DynamicTableDataColumn(
        label: const Text(
          "Date Received",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.date(
          context: context,
          decoration: const InputDecoration(
              hintText: "Date",
              suffixIcon: Icon(Icons.date_range),
              border: OutlineInputBorder()),
          initialDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
        ),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Principal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Interest",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Fines",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Fine",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Description",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Next Pay't Date",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.date(
          context: context,
          decoration: const InputDecoration(
              hintText: "Date",
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

  _buildAddForm(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: const PaymentForm(),
        );
      },
    );
  }
}
