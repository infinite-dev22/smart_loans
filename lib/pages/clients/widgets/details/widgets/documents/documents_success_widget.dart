import 'dart:math';

import 'package:dynamic_table/dynamic_input_type/dynamic_table_input_type.dart';
import 'package:dynamic_table/dynamic_table_data_cell.dart';
import 'package:dynamic_table/dynamic_table_data_column.dart';
import 'package:dynamic_table/dynamic_table_data_row.dart';
import 'package:dynamic_table/dynamic_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/data_source/models/document_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/clients/widgets/details/add_document_form.dart';

class LoanDocumentsSuccessWidget extends StatefulWidget {
  const LoanDocumentsSuccessWidget({super.key, required this.documents});

  final List<DocumentModel> documents;

  @override
  State<LoanDocumentsSuccessWidget> createState() =>
      _LoanDocumentsSuccessWidgetState();
}

class _LoanDocumentsSuccessWidgetState
    extends State<LoanDocumentsSuccessWidget> {
  var tableKey = GlobalKey<DynamicTableState>();
  late List _documents;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    _documents = widget.documents.map((doc) => doc.toList()).toList();
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
              _documents[index] = row;
              return true;
            },
            onRowDelete: (index, row) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Row Deleted index:$index row:$row"),
                ),
              );
              _documents.removeAt(index);
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
              _documents[index] = newValue; // Update data
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
      _buildButton("Add", _buildAddDocumentDialog),
    ];
  }

  List<DynamicTableDataRow> _buildRows() {
    return List.generate(
      _documents.length,
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
          _documents[index].length,
          (cellIndex) => DynamicTableDataCell(
            value: _documents[index][cellIndex],
          ),
        ),
      ),
    );
  }

  List<DynamicTableDataColumn> _buildColumns() {
    return [
      DynamicTableDataColumn(
        label: const Text(
          "ID",
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
          "Name",
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
          "Name On File",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Temp Key",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "External Key",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Mime Type",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Size",
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
          "Document Type",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        dynamicTableInputType: DynamicTableInputType.text(),
      ),
      DynamicTableDataColumn(
        label: const Text(
          "Document Status",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onSort: (columnIndex, ascending) {},
        dynamicTableInputType: DynamicTableInputType.text(),
        // dynamicTableInputType: DynamicTableInputType.date(
        //   context: context,
        //   decoration: const InputDecoration(
        //       hintText: "Date added",
        //       suffixIcon: Icon(Icons.date_range),
        //       border: OutlineInputBorder()),
        //   initialDate: DateTime.now(),
        //   lastDate: DateTime.now().add(
        //     const Duration(days: 365),
        //   ),
        // ),
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
          child: const DocumentForm(),
        );
      },
    );
  }
}
