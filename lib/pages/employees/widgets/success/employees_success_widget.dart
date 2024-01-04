import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/widgets/details/employee_form.dart';
import 'package:smart_loans/pages/employees/widgets/success/smaple_data.dart';

class EmployeesSuccessWidget extends StatefulWidget {
  const EmployeesSuccessWidget({super.key, required this.blocProvider});

  // Add final variable to hold bloc passed from parent widget.
  final EmployeeBloc blocProvider;
  @override
  State<EmployeesSuccessWidget> createState() => _EmployeesTableWidgetState();
}

class _EmployeesTableWidgetState extends State<EmployeesSuccessWidget> {
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  List<String> _selectedRowKeys = [];
  int _rowsPerPage = 20;

  /// DataGridSource required for SfDataGrid to obtain the row data.

  Widget _buildLayoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) => SizedBox(
        width: constraint.maxWidth,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: WebDataTable(
            header: const Text('Employees'),
            actions: _buildActions,
            source: WebDataTableSource(
              sortColumnName: _sortColumnName,
              sortAscending: _sortAscending,
              filterTexts: _filterTexts,
              columns: [

                WebDataColumn(
                  name: 'first_name',
                  label: const Text('Name'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'telephone',
                  label: const Text('Telephone'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'email',
                  label: const Text('Email'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'addedAt',
                  label: const Text('AddedAt'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'role',
                  label: const Text('Role'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
              ],
              rows: widget.blocProvider.state.employees!
                  .map((e) => e.toJson()).toList(),
              selectedRowKeys: _selectedRowKeys,
              onTapRow: (rows, index) {
                Navigator.pushNamed(context, "/employee");
              },
              onSelectRows: (keys) {
                print('onSelectRows(): count = ${keys.length} keys = $keys');
                setState(() {
                  _selectedRowKeys = keys;
                });
              },
              primaryKeyName: 'clientNo',
            ),
            horizontalMargin: 100,
            onPageChanged: (offset) {
              print('onPageChanged(): offset = $offset');
            },
            onSort: (columnName, ascending) {
              print(
                  'onSort(): columnName = $columnName, ascending = $ascending');
              setState(() {
                _sortColumnName = columnName;
                _sortAscending = ascending;
              });
            },
            onRowsPerPageChanged: (rowsPerPage) {
              print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
              setState(() {
                if (rowsPerPage != null) {
                  _rowsPerPage = rowsPerPage;
                }
              });
            },
            rowsPerPage: _rowsPerPage,
          ),
        );
      }),
    );
  }

  List<Widget> get _buildActions {
    return [
      SizedBox(
        width: 40.w,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "Search employees",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (text) {
            _filterTexts = text.trim().split(' ');
            _willSearch = false;
            _latestTick = _timer?.tick;
          },
        ),
      ),
      SizedBox(width: 1.w),
      if (_selectedRowKeys.isNotEmpty)
        _buildButton(
          "Delete",
          () {
            setState(() {
              _selectedRowKeys.clear();
            });
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red)),
        ),
      if (!Responsive.isMobile(context) && !Responsive.isTablet(context))
        _buildButton("Copy", () {}),
      _buildButton("Export", () {}),
      if (!Responsive.isMobile(context)) _buildButton("Filter", () {}),
      _buildButton("Add", () async {
        _buildAddForm();
      }),
    ];
  }

  Widget _buildButton(String title, Function()? onPressed,
      {ButtonStyle? style}) {
    return FilledButton(
      onPressed: onPressed,
      style: style,
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
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: const EmployeeForm(),
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
    widget.blocProvider.add(GetEmployees());

    _sortColumnName = "";
    _sortAscending = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
            print('filterTexts = $_filterTexts');
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
